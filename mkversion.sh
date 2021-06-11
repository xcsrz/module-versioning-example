


if (($# != 1)) || [[ ! -d "components/${1}" ]]
then
    echo "You must specify a valid component"
    exit 1
fi

echo "Creating new version of ${1}"
cd "components/${1}"
start=$(ls | head -n 1)
num=(${start:1})
# there ought to be a better way to do this
while true
do
    num=$(($num+1))
    if [[ ! -d "v${num}" ]]
    then
        oldnum=$(($num-1))
        break
    fi
done
echo "Creating v${num} of ${1} from v${oldnum}"
# unnecessary sanity check
if [[ ! -d "v${oldnum}" ]]
then
    echo "The v${oldnum} version cannot be found.  Cannot proceed."
    exit 1
fi
git mv "v${oldnum}" "v${num}"
git commit -m "creating v${num} of [ ${1} ] (step 1/2)"
cp -R "v${num}" "v${oldnum}"
git add "v${oldnum}"
git commit -m "creating v${num} of [ ${1} ] (step 2/2)"

# just for demo purposes
echo "// migrated from ${oldnum} to ${num}" $(date) >> "v${num}/index.js"
git add "v${num}"
git commit -m "adding comment to track progress"
