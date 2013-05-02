if not exist {%2.jpg} (
    mimetex -d %1 -e %2.gif
    convert %2.gif %2.jpg
    rm %2.gif
)
