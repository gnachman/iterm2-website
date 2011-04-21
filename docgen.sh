echo Run markdown
~/Downloads/Markdown_1.0.1/Markdown.pl < _posts/2011-01-08-documentation.md > /tmp/docs_in.html
echo Concatenate
cat docs_prologue.html /tmp/docs_in.html docs_epilogue.html > /tmp/docs.html

