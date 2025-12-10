#!/usr/bin/env bash
# yazi-like fzf preview script using ImageMagick

FILE="$1"

if [ -z "$FILE" ]; then
    exit 0
fi

# 1. Directory → tree preview
if [ -d "$FILE" ]; then
    tree -C "$FILE" | head -100
    exit 0
fi

# 2. JSON → jq pretty print
if [[ "$FILE" =~ \.json$ ]] && command -v jq >/dev/null 2>&1; then
    jq . "$FILE" | head -100
    exit 0
fi

# 3. Text → bat syntax-highlighted
if file --mime "$FILE" | grep -q text; then
    bat --style=numbers --color=always "$FILE" || cat "$FILE"
    exit 0
fi

# 4. PDF → first page preview (ASCII or image)
if [[ "$FILE" =~ \.pdf$ ]] && command -v pdftoppm >/dev/null 2>&1; then
    pdftoppm -f 1 -singlefile -scale-to 80 "$FILE" /tmp/fzf_pdf_preview >/dev/null 2>&1
    if command -v img2txt >/dev/null 2>&1; then
        img2txt /tmp/fzf_pdf_preview.png
    else
        echo "[PDF: $FILE]"
    fi
    exit 0
fi

# 5. Images (PNG, JPG, HEIC, JPEG XL, SVG, fonts) → ImageMagick preview
if file "$FILE" | grep -qE "image|bitmap" || [[ "$FILE" =~ \.svg$ ]] || [[ "$FILE" =~ \.ttf$ ]]; then
    if command -v magick >/dev/null 2>&1; then
        TMP_IMG="/tmp/fzf_img_preview.png"
        magick convert "$FILE"[0] -resize 200x "$TMP_IMG" >/dev/null 2>&1
        if command -v imgcat >/dev/null 2>&1; then
            imgcat "$TMP_IMG"
        else
            echo "[Image: $FILE]"
        fi
    else
        echo "[Image File: $FILE]"
    fi
    exit 0
fi

# 6. Video → thumbnail
if [[ "$FILE" =~ \.(mp4|mkv|mov|webm)$ ]] && command -v ffmpeg >/dev/null 2>&1; then
    TMP_VIDEO="/tmp/fzf_video_preview.png"
    ffmpeg -i "$FILE" -vf "thumbnail,scale=120:-1" -frames:v 1 "$TMP_VIDEO" -y >/dev/null 2>&1
    if command -v imgcat >/dev/null 2>&1; then
        imgcat "$TMP_VIDEO"
    else
        echo "[Video: $FILE]"
    fi
    exit 0
fi

# 7. Archive → 7z list
if [[ "$FILE" =~ \.(zip|7z|tar|tar.gz|rar)$ ]] && command -v 7z >/dev/null 2>&1; then
    7z l "$FILE" | head -100
    exit 0
fi

# 8. Binary → hexdump
if file "$FILE" | grep -q binary; then
    hexdump -C "$FILE" | head -200
    exit 0
fi

# 9. Fallback → bat or cat
bat --style=numbers --color=always "$FILE" 2>/dev/null || cat "$FILE"
