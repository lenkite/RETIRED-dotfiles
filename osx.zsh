function pw() {
    p=`grealpath $1`
    echo $p
    echo $p | pbcopy
}
