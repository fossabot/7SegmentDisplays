#!/usr/bin/cmake -P

file(STRINGS "words.txt" words)
set(maxlen "0")

foreach(word ${words})
    string(LENGTH ${word} wlen)
    string(REGEX MATCH ".*[GKMQVWXZIOgkmqvwxzio].*" invalid ${word})
    if(wlen EQUAL maxlen AND NOT invalid)
        list(APPEND longest ${word})
    elseif(wlen GREATER maxlen AND NOT invalid)
        set(longest ${word})
        set(maxlen ${wlen})
    endif()
endforeach()

foreach(l ${longest})
    message(${l})
endforeach()

