d:

cd D:\rw\pavelpz\reactx-types-react-patch\src
call git archive -o reactx-types-react-patch.tar
call npm version patch
call npm publish


call git archive --format tar -o reactx-types-react-patch.tar.tz HEAD:src