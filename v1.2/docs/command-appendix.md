# Appendix: System Commands Quick Reference

## Lightbar Functions

Key            Purpose
------------   ----------------------------------
`f1`           Toggle screen mask on/off
`f2` or `f4`   Toggle lightbar page
`f3`           Move white highlight left, switch pages if necessary
`f5`           Move white highlight right, switch pages if necessary
`f7`           Toggle left check mark of highlighted selection
`f8`           Toggle right check mark of highlighted selection

## Lightbar, page 1

-------------------------------------------------------------------------------
  Option  Left                               Right
 -------- ---------------------------------- ----------------------------------
   `Sys`  Enable sysop chat availability.    Enable BASIC line execution trace.
          If the user enters `C` at any      Slow down with `Shift` or
          major prompt, three sirens will    `Shift-Lock`. Normally only used
          sound. Reason for chat is logged.  for debugging.

   `Acs`  Change access level of user. `f3`  Disable 300 baud users from
          increases level, wraps from 9 to   logging in.
          0. `f5` decreases level, wraps
          from 0 to 9. `f7` exits.

   `Loc`  Log in to the BBS from the C64.    Enable "pseudo-local" mode. Gives
                                             access to certain maintenance
                                             commands.

   `Tsr`  Add or subtract time remaining     Toggle Prime Time status.
          for user. `f1` zeroes time (log
          off when able). `f2` gives
          unlimited time (`--:00` display).
          `f3` +1 minute. `f4` +10 minutes.
          `f5` -1 minute. `f6` -10 minutes.
          `f7` exits.

   `Cht`  Enable chat mode.                  Enable local bells, i.e., bells
                                             sent to the user are heard on the
                                             console also.

   `New`  Disable `NEW` users from signing   Disable screen blanking mode. The
          up.                                screen is visible between calls.

   `Prt`  Prints text output to a printer.   Prints log entries to a printer.

   `U/D`  Prevents users from entering the   Prevents 300 baud users from
          U/D section.                       entering the U/D section.
-------------------------------------------------------------------------------

## Lightbar, page 2

-------------------------------------------------------------------------------
  Option  Left                               Right
 -------- ---------------------------------- ----------------------------------
   `Asc`  Enable ASCII translation.          Enable linefeeds.

   `Ans`  Enable ANSI translation.           Enable IBM graphics.

   `Exp`  Enable Expert Mode (skips most     Enable main prompt macros.
          entry screens).

   `Fn5`  Enabled: user receives credit when Enabled: user asked whether to
          upload is validated. Disabled:     `Auto-Logoff After Transfer`
          credit awarded after file          `Complete` in U/Ds.
          uploaded.

   `Fn4`  Undefined.                         Undefined.

   `Fn3`  Undefined.                         Undefined.

   `Fn2`  Undefined.                         Undefined.

   `Fn1`  Undefined.                         Enabled: MCI is not interpreted.
-------------------------------------------------------------------------------

## Idle Screen Keys

 Command  Purpose
--------- ------------------------------
   `<-`   Image Term
   `1`    Set time/date
   `2`    Board Activity Register
   `3`    System disk blocks free
   `4`    Large clock
   `5`    Update free memory
   `6`    Reset modem
   `7`    Reserve BBS
   `8`    View today's BBS log
   `+`    Turn modem speaker on
   `-`    Turn modem speaker off
`Shift-A` Force nightly AutoMaint
`Shift-N` Force nightly NetMail processing
`Shift-T` Invert carrier detect logic
`space`   Redisplay current screen
`pound`   Manual answer

## General Commands

Command   Purpose
--------- ---------------------------------------------------------------------
`?  `       Help menu
`AT `       C/G-ASCII-ANSI graphics mode toggle
`BA `       Board Activity Register
`C  `       Chat request
`CF `       System information
`EP `       Edit Parameters
`EX `       Credit exchange
`F  `       Feedback
`LD `       Last call date
`LG `       Activity log
`NU `       New user message
`O  `       Log off: normal
`O% `       Log off: save last call date
`O! `       Log off: immediately
`O%!`       Log off: save last call date, log off immediately
`PM `       Prompt mode
`Q  `       Quit to main level
`ST `       Status (statistics, flags)
`SY `       Sayings
`T  `       Time and date
`XP `       Expert mode
`ZZ `       Pseudo-local mode

## Local Mode Commands

Command      Purpose
------------ ------------------------------------------------------------------
`??`         Help menu
`BC`         Baud change
`BF`_dv,dr_  Blocks free
`CD`         Change device number
`CP`         File copier
`DC`         DOS command
`ECS`        Extended Command Set editor
`ED`         User account editor
`R`          Run a +.file
`RS`         REServe a user account
`VF`         View feedback, new user applications, system logs
`WF`         Write file (simple file editor)

## Subsystems

### Shared Commands

These commands are commonly used among different subsystems, therefore
listed here. An _item_ could be a post in a sub-board, file in an U/D or U/X
library, news item in the News Files section, or RLE (Run-length Encoded)
graphics file.

Some commands (`About`, for example) are common among subsystems, but list
different information about each item. They are listed in the appropriate
section along with what information they show.

### Command Ranges

Some commands accept an optional parameter, denoted as _x_. This means you can
specify _ranges_ of items to perform the command on. Specifying _x_ acts on
item _x_. Specifying _x-_ acts on item _x_ to the last item.  Specifying _x-y_
acts on items _x_ through _y_.

----------------------------------------------------------------------------
Command       Purpose
------------  --------------------------------------------------------------
_x_           Move to sub-board #_x_

`< << >> >`   Move to first, previous, next, last library in a SIG[^1]

`L`_x_        List items

`A`_x_        About items

`RA RN`       Read new items: new in all libraries, new in current library

`SA SN S`_x_  Scan items: new in all libraries, new in current library,
              new from #_x_ on

`K`_x_        Kill item

`E`_x_        Edit item
----------------------------------------------------------------------------

[^1]: _SIG_, short for "Special Interest Group," is a way of grouping
related items into a directory or library which can be navigated through.

### Message Bases

Command           Purpose
------------      ---------------------------------------------------
`P`               Post new bulletin (prefix title with `^` to freeze)
`S`_x_ `SA`, `SN` Scan bulletins
`A`_x_            About bulletins: list author, number of replies
`K`_x_            Kill a thread
`RA`, `RN`        Read bulletins

<!-- `\^_<title>_`  Freeze bulletins: allow/disallow replies -->

#### End-of-Bulletin Commands

This menu is only available if the user's `P`rompt `M`ode is enabled.

Command        Purpose
------------   -------------------------------------------------------
_x_            Read from response #_x_
`F`            Toggle frozen status (if frozen, no replies possible)
`K`            Kill post, if no responses
`O`            Read entire bulletin over
`P`            Send private e-mail to original poster
`Q`, `/`       Quit `RN` or `RA` read function

`Return`       Continue to next bulletin

#### Message Bases, SubOp Commands

These commands are only available to SubOps or Sysops.

-------------------------------------------------------------------------------
Command        Purpose
------------   -------------------------------------------------------
`KO`           Kill from response #_x_

`Z`            Edit board details: device/drive, entry screens, etc.

-------------------------------------------------------------------------------

## Upload/Download/Exchange

Command      Purpose
------------ -----------------------------------------------------------
`D `         Download single file
`DM`         Download multiple files
`E`_x_       Edit directory entry details
`K`_x_       Kill file (remove from directory, optionally scratch file)
`L`_x_       List files
`PR`         Change protocol
`R`_x_       Read sequential/program files
`U `         Upload single file
`UM`         Upload muliple files
`V`_x_       Validate file
`Z`          Subop menu
`??`         Copy/move files *fixme*
`$`          U/X: Get directory

### U/D About menu

Command      Purpose
------------ -----------------------------------------------------------
`E `         Edit file (if original uploader or subop): Blocks
`D `         Download file
`N `         Next file
`L `         Last file
`M `         Mail uploader
`Return`     Exit


## Electronic Mail

Command      Purpose
---------    -----------------------------------------
_x_          Read e-mail #_x_
`Return`     Read next e-mail
`D`          Delete e-mail
`FR`         Personal file storage
`L`          List e-mail
`R`_x_       Respond to a message
`S`          Send e-mail
`V`          Verify e-mail (count, how many from you)
`VE`         Edit email already sent
(move)       Forced e-mail

## News

Command      Purpose
---------    ------------------------------------------------------------------
`A`          Add a news file (prefix title with `$` to create recurring news)
`R`_x_       Read news file
`Return`     Read next news file
`K`_x_       Kill news file
`E`_x_       Edit news file (can update news date here)
`L`_x_       List news file

## Movie/Plus/RLE/Text File Libraries

Command      Purpose
---------    ----------------------
`MF`         Movie file library
`NF`         News file library
`PF`         Plus file library
`RF`         RLE file library
`TF`         Text file library

Command      Purpose
---------    ------------------------------------------------------------------
_x_          Enter subdirectory, or run plus-file
`A`          Add item (`d.`_subdir_: add subdirectory named _subdir_)
`B`, `<-`    Go back a subdirectory
`CS`         Change speed of Movie File display
`E`_x_       Edit subdirectory or file
`K`_x_       Kill subdirectory or file
`L`_x_       List files (filename, date added, number of accesses, last access)
`M`          Go to main level (root directory)
`QL`         Quick list (just filenames)

## BBS List Database

Command      Purpose
---------    ------------------------------------------
`?`          Command menu
`A`          Add a BBS
`D`          Display BBS notes
`E`          Edit BBS flags
`L`          List BBSes
`Q`          Quit to main prompt
`R`          Remove a BBS

## Voting Booth

Command      Purpose
---------    -----------------------------------------------------
_x_          Vote on (or view results if voted on) for topic #_x_
`A`          Add topic
`E`          Edit topic
`K`          Kill topic
`L`          List topics

## User List

Command   Purpose
--------- ------------------------------------------------------------------
`Q`       Quick listing: sort numerically/alphabetically, choose criteria
`R`       Regular listing: filter by several criteria, or list all users

## Image Text Editor

------------------------------------------------------------------------------
Command   Purpose
--------- ------------------------------------------------------------------
`.A`      Abort text entry

`.B`      Border around text

`.C`_x_   Report column width. _x_: Adjust column width (22-80)

`.D`      Delete line(s)

`.E`      Edit line(s)

`.F`      Find text

`.H`      Help file

`.I`      Insert line(s)

`.J`      Justify line(s): Center, Expand, Indent, Left, Packed, Right,
          Un-Indent

`.K`      Find-and-replace text

`.L`      List lines with line numbers

`.M`      Read with Message Command Interpreter

`.N`      New (clear) text buffer

`.O`      Line numbering mode toggle

`.Q`      Query lines used/remaining (local mode: memory free)

`.R`      Read line(s) without interpreting MCI

`.S`      Save all text

`.V`      Editor version

`.Y`      Move line(s) from \_\_\_ to \_\_\_

`.Z`      Copy line(s) from \_\_\_ to \_\_\_
------------------------------------------------------------------------------

### WF Editor Commands

Command      Purpose
---------    ----------------------
`.G`         Get file from disk
`.P`         Put file to disk
`.U`         Un-.Border text
`.!`         DOS command
`.$`         Disk directory
`.&`         Read (display) file

## Control keys

Command      Purpose
---------    ------------------------------------------
`Ctrl-A`     A

## Message Command Interpreter Commands

pound a _text_ pound ........................................ Do a thing
