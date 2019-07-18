# Introduction
This is a little bash-script I wrote to augment the power of [opsdisk's metagoofil fork](https://github.com/opsdisk/metagoofil) with some parsing and filtering.
So far parsing and filtering works for pdf-files. Other formats (doc, docx, xls, xlsx, ... ) are planned.

# Requirements:
* [opdisk's metagoofil](https://github.com/opsdisk/metagoofil)
* [docsplit](https://github.com/documentcloud/docsplit)
* [poppler-utils](http://poppler.freedesktop.org/)

# Installation
After installing all the required software clone this repository into your /HOME folder:
```
git clone htts://github.com/TalmarGrosskotz/megagoofil
```
Then make the script executable:
```
cd megagoofil
chmod +x megagoofil.sh
```

# Usage
**Attention!** Up to this stage all parameters are required. Later versions will likely supply standard values for some of them.

Move into the megagoofil directory:
```
cd ~/megagoofil
```
Start the script with 
```
./megagoofil.sh -d <DOMAIN> -l <SEARCHFINDS> -n <DOWNLOADS> -o <OUTPUTDIR> -t <FILETYPE>
```
|**Parameter**|**Explanation**                                                                                    |
|-------------|---------------------------------------------------------------------------------------------------|
| -d          | sets the domain you want to search (e.g. your-domain.xyz)                                         |
| -l          | sets the number of search results used                                                            |
| -n          | sets the number of documents actually downloaded                                                  |
| -o          | sets the directory where all the files will be downloaded to (will be created if it doesn't exist)|
| -f          | sets the filetype looked for (only "pdf" so far)                                                  |

The script will then search the domain for files and download them into the specified directory. 
After that it will tried to convert the downloaded files into .txt and also save them into the output directory.
Then it will safe the author of each document (if provided in the pdf's metadata) into a file called "author.txt" and all email-adresses found in the document into a file called emails.txt.

#To-Do
* add more filetypes
* add defaults for -l, -n, -o
* parsing for email-addresses produces some false positives which need to be removed

