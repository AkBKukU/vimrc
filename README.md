# vimrc
My vim configuration files


## Install
You can copy the files like usual, I've made a `install.sh` script you can run
though to do it as well.

## What is configured?
The biggest things are my custom syntax colors, spell check is enabled, and `<Tab>` being bound to 
opening `netrw` to give you a file browser in the editor.

If you're new to `netrw` here are some quick shortcut keys you can use in the 
window:

 - `Enter` **Edit file** - Opens the highlighted file in the last used buffer.
 - `%` **Create new file** - Creates a new file in CWD, NOT the one you've 
 highlighted. This does open the file in the `netrw` window though and pressing 
 `<Tab>` will close it without warning or writing.
 - `v` **Open in vertical split** - Splits last active window vertically and opens 
 file in new buffer.
 - `D` **Delete file** - Deletes the highlighted file.
 - `R` **Rename file** - Rename the highlighted file.
 - `x` **Open file** - Open the highlighted file with associated program.(ie 
 `xdg-open`, to view a PDF)


## Vim tips
Here are some general vim tips that will help make your life easier. I'm 
skipping some basic ones you probably memorized already:

### Normal Mode
 - `v` - **Visual mode** - Lets you see a text selection starting from where you
 cursor was. Can then be used with other commands like `y` & `d`.
 - `{` & `}` - **Next & Prev empty line**
 - `gg` - **Top of buffer**
 - `GG` - **Bottom of buffer**
 - `.` - **Repeat last edit** - Repeats the last thing you did which can include
 editing in Insert mode. Very useful to bulk changes with using the command 
 line.
 - `/` & `n` - **Find & Next** - Find instances of a search and move to the next
 instance.
 - `z=` - **Spell check word** - Shows similar words to replace a word with 
 based on spelling. Chose new word with its number.

### Command Line
 - `%` - **Select buffer** - This means you'll run the command on the whole buffer
 (ex `%s/this/that/g` will replace `this` with `that` everywhere in the open 
 file)
 - `#,#` - **From line # to line #** - Select line number range to perform 
 command on.(ex `22,25s/this/that/g` will replace `this` with `that` on lines 
 22, 23, 24, & 25 in the open file)

### Visual Mode
 - `:` - **Run command on selection** - This will insert `'<,'>` in the command 
 line which will let you run commands on the selected text.(ex `'<,'>s/this/that/g` will replace `this` with `that` in the selected text)
