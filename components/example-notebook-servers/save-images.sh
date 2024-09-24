#!/bin/bash

# Define the output tar file
OUTPUT_FILE="notebook_images.tar"

# Create a temporary directory
TEMP_DIR=$(pwd)/images
mkdir -p $TEMP_DIR

# Save the list of Docker images
# docker images --format "{{.Repository}}:{{.Tag}}" > "$TEMP_DIR/image_list.txt"

# # Save each image as a tar file
images=""
while IFS= read -r image; do
    images+="$image "
    # docker save "$image" -o "$TEMP_DIR/$(echo $image | tr ':' '_' | tr "/" "_").tar"
done < "$TEMP_DIR/image_list.txt"

# # Create a tar file containing all the image tar files
echo "docker save $images > $TEMP_DIR/$OUTPUT_FILE"
docker save $images > "$TEMP_DIR/$OUTPUT_FILE"

# # Clean up
# rm -rf "$TEMP_DIR"

echo "Docker images saved to $TEMP_DIR/$OUTPUT_FILE"
