DIR="$(dirname $(readlink -f $0))"

. $DIR/.config

mkdir -p $DIR/.local

OUT=$DIR/.local/$(date +"%H%M%S_%d%m%y").tar.gz
tar -czf $OUT -C . --exclude="." --exclude=".." --exclude ".local" $(ls -a .)

$DIR/$BACKEND mkdir "/backupper/"
$DIR/$BACKEND mkdir "/backupper/$REPO"
$DIR/$BACKEND upload $OUT "/backupper/$REPO"
