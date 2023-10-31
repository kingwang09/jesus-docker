import fs from 'fs';
import { json } from 'stream/consumers';


function main(){
    const book = {
        title: 'test'
    };
    const bookJSON = JSON.stringify(book);
    fs.writeFileSync('first.json', bookJSON);
    console.log('write json...');
}

main();