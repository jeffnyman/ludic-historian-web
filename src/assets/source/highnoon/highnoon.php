<?
session_start();
function win(){
$output = "WHAT A SHOT, YOU GOT BART RIGHT BETWEEN THE EYES.

AS MAYOR OF DODGE CITY, AND ON BEHALF OF ITS CITIZENS,
I EXTEND TO YOU OUR THANKS, AND PRESENT YOU WITH THIS
REWARD, A CHECK FOR $20,000, FOR KILLING BLACK BART.

************************************************************

CHECK NO.".((rand()%1000)+1)."\t\t\t\tAUG.".((rand()%30)+1)."TH 1889
\t\t   CASHIER'S RECEIT---BANK OF DODGE CITY
\t\t\tPAY TO THE BEARER ON DEMAND
\t\t\t\tTHE SUM OF
\tTWENTY THOUSAND DOLLARS----------------------$20,000

************************************************************

DON'T SPEND IT ALL IN ONE PLACE.";

return $output;
}

function move($paces){
    $moved = $_SESSION["yourpaces"];
    $moved += $paces;
    $_SESSION["yourpaces"] = $moved;
    $bartmoved = $_SESSION["bartpaces"];
    return "YOU ARE NOW ".(100-($moved+$bartmoved))." PACES APART";
}
function bartmove($paces){
    $moved = $_SESSION["bartpaces"];
    $moved += $paces;
    $_SESSION["bartpaces"] = $moved;
    $youmoved = $_SESSION["yourpaces"];
    return "<br />    BLACK BART MOVES ".$paces." PACES<br />    YOU ARE NOW ".(100-($moved+$youmoved))." PACES APART";
}
function bartlogic($lastmove){
    $moved = $_SESSION["yourpaces"];
    $bartmoved = $_SESSION["bartpaces"];
    $bartshots = $_SESSION["bartshots"];
    $distance = (100-($moved+$bartmoved));
    $bartmove = ($distance<50) ? ((rand()%4)+2) : ((rand()%8)+2);
    if($bartshots==0)
        return 8;                   //now is your chance
    if($bartshots<0)
        return 8;                   //bart runs
    if($bartmove>=5 || $distance<20){                //bart fires
        if($bartmove>($distance/10) || $distance<20){   //he is going to hit you
            if($lastmove==4)
                return 1;           //jumped behind trough, saved
            return 2;               //dead
        }
        if($bartshots==2){
            return 3;               //Miss 1shells
        }else if($bartshots==3){
            return 4;               //Miss 2shells
        }else if($bartshots==4){
            return 5;               //Miss 3shells
        }
        return 6;                   //Miss 0shell
    }
    return 9;                   //Bart walks
}
function report($msg){
    $msg = str_replace("##YOU##",$_SESSION["yourshots"],$msg);
    $msg = str_replace("##BART##",$_SESSION["bartshots"],$msg);
    return $msg;
}
function bartmisses($msg){
    $_SESSION["bartshots"]--;
    $output = "<br />    BART FIRES . . . . . .<br />    A MISS . . . . <br />    ".$msg;
    return $output;
}
function shoot(){
    $moved = $_SESSION["yourpaces"];
    $bartmoved = $_SESSION["bartpaces"];
    if($_SESSION["yourshots"]!=0)
        $_SESSION["yourshots"]--;
    $yourshots = $_SESSION["yourshots"];
    $distance = (100-($moved+$bartmoved));
    $yourmove = ($distance<50) ? ((rand()%4)+2) : ((rand()%8)+2);
    if($yourshots<=0)
        return 6;                   //nice going ace
    if($yourmove>($distance/10) || $distance<10){
        return 1;               //bart is dead
    }
    if($yourshots==1){
        return 2;               //Miss 1shells
    }else if($yourshots==2){
        return 3;               //Miss 2shells
    }else if($yourshots==3){
        return 4;               //Miss 3shells
    }
    return 5;                   //Miss 0shell

}
// state variables
srand(time());
$oldoutput = "";
$state = 0;
$output ="";
if(isset($_POST["state"]) && isset($_POST["moveinput"])){
    $state = $_POST["state"];
    //$response = substr($_POST["moveinput"],1);
    $response = $_POST["moveinput"];
    $oldoutput = $_POST["output"]."<br />    ".$response."<br />";
}else{
    $_SESSION["yourpaces"] = 0;
    $_SESSION["bartpaces"] = 0;
    $_SESSION["yourshots"] = 4;
    $_SESSION["bartshots"] = 4;
    $_SESSION["troughs"]=2;
}
if($response=="rst")
    header("Location:./index.php");
//Game variables
$intro = "\t\t\tH I G H N O O N
\t\t\t---------------

DO YOU WANT INSTRUCTIONS";

$instr = "YOU HAVE BEEN CHANLLENGED TO A SHOWDOWN BY BLACK BART, ONE OF
THE MEANEST DESPERADOES WEST OF THE ALLEGHENY MOUNTAINS.
WHILE YOU ARE WALKING DOWN A DUSTY, DESERTED SIDE STREET,
BLACK BART EMERGES FROM A SALOON ONE HUNDRED PACES AWAY. BY
AGREEMENT, YOU EACH HAVE FOUR CARTRIDGES IN YOUR SIX-GUNS.
YOUR MARKSMANSHIP EQUALS HIS. AT THE START OF THE WALK, NEI-
THER OF YOU CAN POSSIBLY HIT THE OTHER, AND AT THE END OF
THE WALK, NEITHER CAN MISS.  THE CLOSER YOU GET, THE BETTER
YOUR CHANCES OF HITTING BART, BUT HE ALSO HAS BETTER CHANCES
OF HITTING YOU.
DO YOU STILL WANT TO CONTINUE";

$moves = "\t\t\t*M O V E S*
\t\t\t===========

\t\t\t1. ADVANCE
2. STAND STILL\t\t\t\t3. FIRE

4. JUMP BEHIND WATERING TROUGH\t\t5. GIVE UP

\t\t\t6. TURN TAIL AND RUN

";

$messages = array("WHAT IS YOUR STRATEGY",
"HOW MANY PACES DO YOU ADVANCE",
"YOU ARE NOW ##X## PACES APART.",
"NICE GOING , ACE, YOU'VE RUN OUT OF SHELLS.\r\nNOW BART WON'T SHOOT UNTIL YOU TOUCH NOSES.\r\nYOU BETTER THINK OF SOMETHING FAST. (LIKE RUN)",
"WHAT A LOUSY SHOT.",
"BLACK BART MOVES ##X## PACES",
"NOW IS YOUR CHANCE, BART IS OUT OF SHELLS",
"BART FIRES . . . . . .",
"A MISS . . . .",
"WHEW, WERE YOU LUCKY. THAT BULLET JUST MISSED YOUR HEAD.",
"BART SHOT YOU RIGHT THROUGH THE HEART THAT TIME.\r\nYOU WENT KICKIN' WITH YOUR BOOTS ON.",
"GREENHORN",
"THAT MOVE MADE YOU A PERFECT STATIONARY TARGET",
"NOT A BAD MANEUVER, YOU THREW BART'S STRATEGY OFF",
"YOU NOW HAVE ##YOU## SHELLS TO BART'S ##BART## SHELLS.",
"BLACK BART ACCEPTS. THE CONDITIONS ARE THAT HE WON'T SHOOT YOU\r\nIF YOU TAKE THE FIRST STAGE OUT OF TOWN AND NEVER COM BACK\r\nAGREED",
"A VERY WISE DECISION.",
"OH WELL, BACK TO THE SHOWDOWN",
"HOW FAR DID YOU RUN",
"MAN DID HE RUN. HE RAN SO FAST EVEN THE DOGS COULDN'T\r\nCATCH HIM",
"BLACK BART FIRES ##SHELLS## SHELLS.......",
"HE GOT YOU RIGHT IN THE BACK.  THATS WHAT YOU DESERVE\r\nFOR RUNNING.",
"BLACK BART UNLOADED HIS GUN, ONCE IN YOUR BACK\r\nAND ##ASS## TIMES IN YOUR A**. NOW YOU CAN'T EVEN REST IN \r\nPEACE.",
"YOU WERE LUCKY, BART CAN ONLY THROW HIS GUN AT YOU, HE\r\nDOESN'T HAVE ANY SHELLS LEFT. YOU SHOULD REALLY BE DEAD.",
"GRAZED BART IN THE RIGHT ARM",
"HE'S HIT IN THE LEFT SHOULDER, FORCING HIM TO USE HIS RIGHT\r\nHAND TO SHOOT WITH",
"THAT WAS YOUR LAST SHOT, YOU MISSED",
"BUT BART GOT YOU IN THE RIGHT SHIN.",
"THAT TRICK SAVED YOUR LIFE. BART'S BULLET\r\nWAS STOPPED BY THE WOOD SIDES OF THE TROUGH.",
"THOUGH BART GOT YOU ON THE LEFT SIDE OF YOUR JAW.",
"BART MUST HAVE JERKED THE TRIGGER",
"NOBODY CAN WALK THAT FAST",
"NONE OF THIS NEGATIVE STUFF PARTNET, ONLY POSITIVE NUMBERS",
"BART JUST HI-TAILED IT OUT OF TOWN RATHER THAN FACE YOU WITH-\r\nOUT A LOADED GUN. YOU CAN REST ASSURED THAT BART WON'T EVER\r\nSHOW HIS FACE AROUND THIS TOWN AGAIN.",
"HOW MANY WATERING TROUGHS DO YOU THINK ARE ON THIS STREET",
"C.G. Inc.",
"YOU SURE AREN'T GOING TO LIVE VERY LONGIF YOU CAN'T EVEN\r\nFOLLOW DIRECTIONS");
$spacer = "\r\n";

switch($state){
    case 0: //Beginning of the game
        $output = $intro;
        $nextstate=1;
        break;
    case 1: //instructions yes/no
        if(strtoupper($response)=="YES"){
            $output = $instr;
            $nextstate=2;
            break;
        }
    case 3: //lucky number
        $output = "WHAT IS YOUR LUCKY NUMBER FOR TODAY";
        $nextstate = 4;
        break;
    case 2: //sure you want to continue?
        if(strtoupper($response)=="YES"){
            $output = $moves;
            $output .= $spacer."WHAT IS YOUR LUCKY NUMBER FOR TODAY";
            $nextstate = 4;
            break;
        }else{
            $output = $messages[11].$spacer.$messages[35];
            $nextstate=1000;
            break;
        }
    case 4:
        $nextstate = 5;
        break;
    case 5:
    case 6:
        $nextstate = 6;
        //if move >6, <1 or not a number
        if(!is_numeric($response) || $response>6){
            $output = $messages[36];
            break;
        }
        if($response<1){
            $output = $messages[32];
            break;
        }
        //if legit move
        if($response==1){
            $output = $messages[1]; //ask how far
            $nextstate = 7;         //handle move
            break;
        }else if($response==2){
            $output = $messages[12]; //standstill
        }else if($response==3){
            $result = shoot();
            if($result==1){
                $output = win();
                $nextstate=1000;
                break;
            }else if($result==2){
                $output = $messages[25];
            }else if($result==3){
                $output = $messages[24];               //Miss 2shells
            }else if($result==4){
                $output = $messages[4];               //Miss 3shells
            }else if($result==5){
                $output = $messages[26];
            }else if($result==6){
                $output = $messages[3];
            }
        }else if($response==4){
            if($_SESSION["troughs"]!=0){
                $_SESSION["troughs"]--;
                $output = $messages[13];
            }else{
                $output = $messages[34];
                $response=2;
            }
        }else if($response==5){
            $output = $messages[15];
            $nextstate = 8;
        }else if($response==6){
            $output = $messages[18];
            $nextstate = 9;
        }
        break;
    case 7:
        if($response>10){
            $output = $messages[31].$spacer.$messages[1];
            $nextstate = 7;
            break;
        }
        $output = move($response);
        $nextstate = 6;
        $response = 1;
        break;
    case 8:
        if(strtoupper($response)=="YES"){
            $output = "A VERY WISE DECISION.";
            $nextstate=1000;
            break;
        }else{
            $output = "OH WELL, BACK TO THE SHOWDOWN";
            $nextstate=5;
            break;
        }
    case 9:
        if($response>50){
            $output = $messages[19];
            $nextstate=1000;
            break;
        }else{
            $output = "BLACK BART FIRES ".$_SESSION["bartshots"]." SHELLS......";
            $nextstate=1000;
            if($_SESSION["bartshots"]>1){
                $output .= $spacer."BLACK BART UNLOADED HIS GUN, ONCE IN YOUR BACK<br />    AND ".($_SESSION["bartshots"]-1)." TIMES IN YOUR A**. NOW YOU CAN'T EVEN REST IN<Br />    PEACE.";
            }else if($_SESSION["bartshots"]==0){
                $output .= $spacer."YOU WERE LUCKY, BART CAN ONLY THROW HIS GUN AT YOU, HE<br />    DOESN'T HAVE ANY SHELLS LEFT. YOU SHOULD REALLY BE DEAD.";
            }else{
                $output .= $spacer."HE GOT YOU RIGHT IN THE BACK. THATS WHAT YOU DESERVE<br />    FOR RUNNING.";
            }
        }
    default:
        break;
}
if($nextstate==6){
    $bartmove = bartlogic($response);
    switch($bartmove){
        case 1:
            $output .= bartmisses($messages[28]);
            break;
        case 2:
            $_SESSION[bartshots]--;
            $output .= $spacer."BART FIRES . . . . . .".$spacer.$messages[10];
            $nextstate=1000;
            break;
        case 3:
            $output .= bartmisses($messages[27]);
            break;
        case 4:
            $output .= bartmisses($messages[29]);
            break;
        case 5:
            $output .= bartmisses($messages[30]);
            break;
        case 6:
            $output .= bartmisses($messages[9]."<br />    ".$messages[6]);
            break;
        case 8:
            $output .= $spacer.$messages[33];
            $nextstate = 1000;
            break;
        case 9:
            $output .= bartmove(((rand()%8)+2));
            break;
        default:
            $output .= "bart does a dance";
            break;
    }
    if($nextstate!=1000)
    $output .= $spacer.report($messages[14]);
}
if($nextstate==5 || $nextstate==6){
    $output .= $spacer.$messages[0];
}
if($nextstate==1000)
    $output .= "<br /><br />    Game Over . . .<br />    C.G. Inc.";
$output = str_replace("\r\n","<br />    ",$output);
$output = "    ".$output;
?>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var text = "<? echo $output; ?>";
var oldtext = "<? echo $oldoutput; ?>";
var delay=50;
var currentChar=1;
var destination="[not defined]";

function type()
{
  if (document.getElementById)
  {
    var dest=document.getElementById(destination);
    if (dest)// && dest.innerHTML)
    {
      if(text[currentChar-1]!="<"){
          dest.innerHTML="<pre>"+oldtext+text.substr(0, currentChar)+"</pre>";
      }else{
            dest.innerHTML="<pre>"+oldtext+text.substr(0, currentChar+1)+"</pre>";
            currentChar++;
      }
      currentChar++
      if (currentChar>text.length)
      {
        currentChar=1;
        //setTimeout("type()", 5000);
        act.output.value=oldtext+text;
        input = document.getElementById("moveinput");
        input.style.display = "block";
        //input.value = prompt;
        input.focus();
        
      }
      else
      {
        setTimeout("type()", delay);
      }
    }
  }
}

function startTyping(textParam, delayParam, destinationParam)
{
  text=textParam;
  delay=delayParam;
  currentChar=1;
  destination=destinationParam;
  type();
}
//-->
</SCRIPT>
<title>High Noon  - Circa 1970</title>
</head>
<body>
<?
//echo "State was: ".$state." Next state: ".$nextstate." Response was: ".$response."<br />";
echo "Type 'rst' to any question to restart!";
?>
<DIV style="background: url(./bg.jpg);background-repeat:repeat-y;" ><DIV ID="textDestination">...</DIV>
<div id="inputform" <? if($nextstate==1000) echo "style='display:none'"; ?> >
<form id="act" action="<? echo $_SERVER["PHP_SELF"]; ?>" method="POST">
<input type="hidden" name="state"  value="<? echo $nextstate; ?>" />
<input type="hidden" name="output" />
<input id="moveinput" name="moveinput" type="text" value="" maxlength="4" size="6" style="display:none;background-color: transparent;border: none;border-bottom:none;padding-left:30px;" />
<input type="submit" style="border: none;display:none;" value="Enter" />
</form>
</div>
<div>
<div style="display:<? if($nextstate==1000) echo "block"; else echo "none"; ?>">
<a href="./index.php">Click here to restart</a>
</div>
</body>
<SCRIPT LANGUAGE="JavaScript">
<!--
startTyping(text, 5, "textDestination");
//-->
</script>
</html>
