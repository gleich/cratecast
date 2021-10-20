CRATECAST_DIR=$(pwd)

# Clone the repo
cd ~/tmp/
rm -rf ./extensions/
gh repo clone extensions -- --depth 1

# Create the cratecast git branch. Delete if it alrady exists.
cd ./extensions/
if [[ $(git branch -a) == *"cratecast"* ]]; then
    git branch -d cratecast
    git push origin --delete cratecast
fi
git checkout -b cratecast

# Removing current extensions
rm -rf ./extensions/extensions/cratecast/

# Copying new extension
cd $CRATECAST_DIR/../
cp -r cratecast ~/tmp/extensions/extensions/
echo
echo "Copied files"

# Cleaning up files
cd ~/tmp/extensions/extensions/cratecast/
rm -rf .git/ LICENSE deploy.sh pnpm-lock.yaml node_modules/ .github/
sed -i '' 's/MPL-2.0/MIT/g' package.json
echo "Cleaned up files from repo"

echo "Go to ~/tmp/extensions/"
