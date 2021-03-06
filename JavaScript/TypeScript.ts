const invalid = (s: string) => (/[gkmqvwxzio]/i).test(s);
let longest: string[] = [], maxlen: number = 0;

require('fs').readFile('words.txt', (err, data) => {
    for(const word of data.toString().split('\n')) {
        if(word.length === maxlen && !invalid(word)) {
            longest.push(word);
        } else if(word.length > maxlen && !invalid(word)) {
            longest = [word];
            maxlen = word.length;
        }
    }

    console.log(longest.join('\n'));
});

