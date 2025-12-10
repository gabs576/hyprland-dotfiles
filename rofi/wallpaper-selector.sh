#!/bin/bash

# Configuration
WALL_DIR="$HOME/Pictures/Wallpapers"

# Function to apply wallpaper and theme
apply_wallpaper() {
    local IMAGE="$1"
    
    # Validate image exists
    if [ ! -f "$IMAGE" ]; then
        notify-send "Error" "Image file not found: $IMAGE"
        echo "ERROR: Image not found: '$IMAGE'" | tee -a "$DEBUG_LOG"
        exit 1
    fi
    
    # Notify start
    notify-send "Changing Theme" "Applying new wallpaper and updating colors, please wait until finished..."
    
    # Apply wallpaper with swww
    swww img "$IMAGE" --transition-type="wipe" --transition-step=90 --transition-fps="60"
    
    # Generate color scheme
    matugen image "$IMAGE"
    
    # Restart waybar
    pkill waybar
    waybar > /dev/null 2>&1 &
    
    # Restart dunst
    pkill dunst
    dunst > /dev/null 2>&1 &

    # Restart swaync
    pkill swaync
    swaync > /dev/null 2>&1 &
    
    # Notify completion
    notify-send "Theme Applied" "Wallpaper and colors updated!"
}

# Main script
main() {
    # Check if wallpaper directory exists
    if [ ! -d "$WALL_DIR" ]; then
        notify-send "Error" "Wallpaper directory not found: $WALL_DIR"
        echo "ERROR: Directory not found: '$WALL_DIR'" | tee -a "$DEBUG_LOG"
        exit 1
    fi
    
    # Change to wallpaper directory
    cd "$WALL_DIR" || exit 1
    
    # Build file list for rofi with icons
    IFS=$'\n'
    SELECTED_WALL=$(for a in *.jpg *.png *.jpeg; do echo -en "$a\0icon\x1f$a\n"; done | rofi -show-icons -dmenu -theme-str 'listview { lines: 3; columns: 3;}' -theme-str 'element-icon { size: 3.5em; }' -p "Wallpaper")
    
    # Exit if no selection
    [ -z "$SELECTED_WALL" ] && exit 0
    
    # Build full image path
    IMAGE_PATH="$WALL_DIR/$SELECTED_WALL"
    echo "DEBUG: Final image path: '$IMAGE_PATH'" | tee -a "$DEBUG_LOG"
    
    # Apply the wallpaper
    apply_wallpaper "$IMAGE_PATH"
}

# Run main function
main
