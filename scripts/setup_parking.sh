# mkdir -p ./cache/parking/
set -e
TARGET_DIR=$(pwd)"/cache/parking/"
if [ -d "$TARGET_DIR" ]; then
rm -r $TARGET_DIR
fi
mkdir -p $TARGET_DIR
echo $TARGET_DIR
ROOT_IMAGES=/data/compressed_all_desay/image
ROOT_LABELS=/data/compressed_all_desay/yolo_labels

cd $TARGET_DIR && ln -s $ROOT_IMAGES ./images
cd $TARGET_DIR && ln -s $ROOT_LABELS ./labels

cd $TARGET_DIR
python -m avcv.run yolo_train_test_split -a $TARGET_DIR 80