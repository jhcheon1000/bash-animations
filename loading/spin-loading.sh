wait_animation() {
        spin='-\|/'
        wait_time=0
        input_time=$(( $1 * 10 ))
        i=0
        while [ $wait_time -lt $input_time ]
        do
                i=$(( (i+1) %4 ))
                printf "\r${spin:$i:1}"
                sleep .1
                wait_time=$(( $wait_time + 1))
        done
        printf "\r\033[K \n"
}

# argument is time that how long do you running (sec)
wait_animation $1

