;
;   888      Y8P                        888                  
;   888      d8b                        888                  
;   888                                 888                  
;   888      888  8888b.  88888b.   .d88888  .d88b.  888d888 
;   888      888     "88b 888 "88b d88" 888 d8P  Y8b 888P"   
;   888      888 .d888888 888  888 888  888 88888888 888     
;   888      888 888  888 888  888 Y88b 888 Y8b.     888     
;   88888888 888 "Y888888 888  888  "Y88888  "Y8888  888 
;
;
;   Autohotkey script for productivity at work
;   Hotstrings
;   by Lycras Euoi
;   -------------------------------
;   |                             |
;   |  Options:                   |
;   |  :O: = Omit end character   |
;   |  :R: = Raw text             |
;   |  :*: = No end character     |
;   |  :?: = trigger always       |
;   |                             |
;   |  #   =   WIN                |
;   |  !   =   Alt                |
;   |  ^   =   Crtl               |
;   |  +   =   Shift              |
;   ------------------------------- 

;================================================================ Default ==================================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

SettingsDir := "C:\Users\" A_UserName "\AutohotkeySetting\"
SettingsFile := "C:\Users\" A_UserName "\AutohotkeySetting\Settings.ini"

; Checks is Settings.ini is created
if !(InStr( FileExist(SettingsDir), "D"))
    {
        DirCreate SettingsDir
        IniWrite("Y",  SettingsFile, "Hotstrings", "hotstringFullOut")
    }

;======================================================= Hotstring Variant Changer =========================================================

; Change shorthand hotstring to fullout variant
; [Crtl] + [Alt] + [Shift] + [W]
^!+W::
    { 
        if(IniRead(SettingsFile, "Hotstrings","hotstringFullOut") = "N")
        {
        IniWrite("Y",  SettingsFile, "Hotstrings", "hotstringFullOut")
        Reload
        }
        else
        {
        IniWrite("N",  SettingsFile, "Hotstrings", "hotstringFullOut")
        Reload
        }
    } 


; Hotstrings

;==================================================================== A ====================================================================
::as::          ; Aanstaande                    of a.s.
{
    LongOrShort("aanstaande", "a.s.") 
}      
:*:aub::        ; Alstublieft                   of a.u.b.
{
    LongOrShort("alstublieft", "a.u.b.") 
}   

;==================================================================== B ====================================================================
::bgg::         ; Bij geen gehoor               of b.g.g.
{
    LongOrShort("bij geen gehoor", "b.g.g.") 
}
:*:bvd::        ; bij voorband dank             of b.v.d.
{
    LongOrShort("bij voorband dank", "b.v.d.") 
}

;==================================================================== C ====================================================================
::cc::          ; Carbon copy                   of c.c.
{
    LongOrShort("carbon copy", "c.c.") 
} 
::cq::          ; Casu quo                      of c.q.
{
    LongOrShort("casu quo", "c.q.") ; Casu quo of c.q.
}

;==================================================================== D ====================================================================
::dd::          ; De dato                       of d.d.
{
    LongOrShort("de dato", "d.d. ") 
}
:*:dmv::        ; Door middel van               of d.m.v.
{
    LongOrShort("door middel van", "d.m.v.") 
}
:*:dwz::        ; Dat wil zeggen                of d.w.z.
{
    LongOrShort("dat wil zeggen", "d.w.z.") ; Dat wil zeggen of d.w.z.
}

;==================================================================== E ====================================================================
::ea::          ; en andere                     of e.a.
{
    LongOrShort("en andere", "e.a.") 
}
::ed::          ;  en dergelijke                of ed 
{
    LongOrShort("en dergelijke", "e.d.") 
}
:*:eea::        ; een en ander                  of e.e.a. 
{
    LongOrShort("een en ander", "e.e.a.") 
}
:*:enz::        ;  enzovoort                    of enz.
{
    LongOrShort("enzovoort", "enz.") 
}

;==================================================================== I ====================================================================
:*:iov::        ; in opdracht van               of i.o.v.
{
    LongOrShort("in opdracht van", "i.o.v.") 
}
:*:ipv::        ; in plaats van                 of i.p.v. 
{
    LongOrShort("in plaats van", "i.p.v.") 
}
:*:ivm::        ; in verband met                of i.v.m. 
{
    LongOrShort("in verband met", "i.v.m.") 
}
:*:iom::        ; in overleg met                of i.o.m. 
{
    LongOrShort("in overleg met", "i.o.m.") 
}
:*:icm::        ; in combinatie met             of i.c.m. 
{
    LongOrShort("in combinatie met", "i.c.m.") 
}

;==================================================================== J ====================================================================
::jl::          ; jongsleden                    of jl. 
{
    LongOrShort("jongsleden", "jl.") 
}

;==================================================================== M ====================================================================
:*:maw::        ; met andere woorden            of m.a.w.
{
    LongOrShort("met andere woorden", "m.a.w.") 
}
:*:mbt::        ; met betrekking tot            of m.b.t.
{
    LongOrShort("met betrekking tot", "m.b.t.") 
}
::mi::          ; mijns inziens                 of m.i. 
{
    LongOrShort("mijns inziens", "m.i.") 
}
::miv::         ; met ingang van                of m.i.v. 
{
    LongOrShort("met ingang van", "m.i.v.") 
}
::mmv::         ; met medewerking van           of m.m.v.
{
    LongOrShort("met medewerking van", "m.m.v.") 
}
::mn::          ;  met name                     of m.n.
{
    LongOrShort("met name", "m.n.") 
}
:*:muv::        ; met uitzondering van          of m.u.v.
{
    LongOrShort("met uitzondering van", "m.u.v.") 
}

;==================================================================== N ====================================================================

:*:nav::        ; naar aan leiding van          of n.a.v.
{
    LongOrShort("naar aan leiding van", "n.a.v.") 
}
::nm::          ; na de middag                  of n.m. 
{
    LongOrShort("na de middag", "n.m.") 
}
::nnb::         ; nog niet bekend               of n.n.b. 
{
    LongOrShort("nog niet bekend", "n.n.b.") 
}
:*:notk::       ; nader overeen te komen        of n.o.t.k.
{
    LongOrShort("nader overeen te komen", "n.o.t.k.") 
}
::nr::          ; nummer                        of nr.
{
    LongOrShort("nummer", "nr.") 
}
:*:ntb::        ; nader te bepalen              of n.t.b.
{
    LongOrShort("nader te bepalen", "n.t.b.") 
}
:*:nvt::        ; niet van toepassing           of n.v.t.
{
    LongOrShort("niet van toepassing", "n.v.t.") 
}

;==================================================================== O ====================================================================

::oa::          ; onder andere(n);              of o.a.
{
    LongOrShort("onder anderen", "o.a.") 
}
::og::          ; ongelijkwaardig               of o.g.
{
    LongOrShort("ongelijkwaardig", "o.g.") 
}
::oi::          ; ons inziens                   of o.i.
{
    LongOrShort("ons inziens", "o.i.") 
}
;==================================================================== P ====================================================================

::po::          ; per omgaande                  of p.o. 
{
    LongOrShort("per omgaande ", "p.o.") 
}
::pp::          ; per persoon                   of p.p.
{
    LongOrShort("per persoon", "p.p.") 
}
::ps::          ; post scriptum                 of p.s
{
    LongOrShort("post scriptum", "p.s") 
}

;==================================================================== S ====================================================================

:*:svp::        ; s’il vous plait               of s.v.p
{
    LongOrShort("s’il vous plait", "s.v.p.") 
}

;==================================================================== T ====================================================================

:*:tav::        ; ter attentie van              of t.a.v.
{
    LongOrShort("ter attentie van", "t.a.v.") 
}
:*:tbv::        ; ten behoeve van               of t.b.v.
{
    LongOrShort("ten behoeve van", "t.b.v.") 
}
::tgv::         ; ten gevolge van               of t.g.v.
{
    LongOrShort("ten gevolge van", "t.g.v.") 
}
::tnv::         ; ter name van                  of t.n.v.
{
    LongOrShort("ter name van", "t.n.v.") 
}
::tov::         ; ten opzichte van              of t.o.v.
{
    LongOrShort("ten opzichte van", "t.o.v.") 
}
:*:tzt::        ; te zijner tijd                of t.z.t.
{
    LongOrShort("te zijner tijd", "t.z.t.") 
}

;==================================================================== V ====================================================================

::vlg::         ; volgende                      of vlg.
{
    LongOrShort("volgende", "vlg.") 
}
::vnl::         ; voornamelijk                  of vnl.
{
    LongOrShort("voornamelijk", "vnl.") 
}
::vv::          ; vice versa                    of v.v.
{
    LongOrShort("vice versa", "v.v.") 
}

;==================================================================== Z ====================================================================

::zgn::         ; zogenaamd                     of zgn.
{
    LongOrShort("zogenaamd", "zgn.") 
}
::zi::          ; zijn inziens                  of z.i.
{
    LongOrShort("zijn inziens", "z.i.") 
}
:*:zoz::        ; zie ommezijde                 of z.o.z.
{
    LongOrShort("zie ommezijde", "z.o.z.") 
}
:*:zsm::        ; zo spoedig mogelijk           of z.s.m.
{
    LongOrShort("zo spoedig mogelijk", "z.s.m.") 
}
  
;=============================================================== Contacten =================================================================

; Contact hotstrings Youri Claes
:O:yc::Youri Claes
:*:yct::06 14318583
:*:yce::youri.claes@alliander.com
:*:ycd::
{
send  "Youri Claes op " A_DD "-" A_mm "-" A_YYYY 
return
}

; Contact hotstrings Edwin de Groot
:O:mue::Edwin de Groot
:*:muet::06 46447969
:*:muee::edwin.de.groot@alliander.com

; Contact hotstrings Tom van Scharrenburg
:O:mut::Tom van Scharrenburg
:*:mutt::06 31031516
:*:mutm::tom.scharrenburg@alliander.com

; Contact hotstrings Jeroen Maas
:O:mpj::Jeroen Maas
:*:mpjt::06 18970503
:*:mpje::jeroen.maas@alliander.com

;============================================================= Autocorrect ===============================================================

; 
:*:mrogen::morgen
:*:durk::druk
:*:oppervalkte::oppervlakte

; ========================================================= Nette schrijfwijze ===========================================================

:*?:m2::
{
send "m" chr(0x00B2)
}
:*?:m3::
{
send "m" chr(0x00B3)
}
:*?:km2::
{
send "km" chr(0x00B2)
}
:*?:km3::
{
send "km" chr(0x00B3)
}
:*:+-::
{
send chr(0x00B1)
}
:*:\dia::
{
send chr(0x00F8)
}
:*:\deg::
{
send chr(0x00B0)
}
:*:goedenacht::
{
    TimeBasedGreeting(LTrim(A_ThisHotkey,":*:"))
}
:*:goedemorgen::
{
    TimeBasedGreeting(LTrim(A_ThisHotkey,":*:"))
}
:*:goedemiddag::
{
    TimeBasedGreeting(LTrim(A_ThisHotkey,":*:"))
}
:*:goedenavond::
{
    TimeBasedGreeting(LTrim(A_ThisHotkey,":*:"))
}

; :*:\euro::
; {
; SendInput, {Ctrl down} {left 1} {Ctrl up} 
; send chr(0x20AC)
; SendInput, {Ctrl down} {right 1} {Ctrl up}
; send chr(0x20AC)
; Return
; }

;================================================================ Functions ===============================================================
LongOrShort(long, short) ; Gets two inputs and depending on de current value saved in C:\Users\$UserName\Autohotkey\Settings.ini wil enter long or short hotstrings
{
    if(IniRead(SettingsFile, "Hotstrings","hotstringFullOut") = "N")
        {
            send(short)
        }
    else if(IniRead(SettingsFile, "Hotstrings","hotstringFullOut") = "Y")
        {
            send(long)
        }
    else
        {
            MsgBox("The configuration file is corrupt","Liander Script: Error")
        }
}

TimeBasedGreeting(greeting)
{
    if(A_Hour > "0" && A_Hour < "6")
    {
        send "Goedenacht"
    }
    else if (A_Hour > "6" && A_Hour < "12")
    {
        send "Goedemorgen"
    }
    else if (A_Hour > "12" && A_Hour < "18")
    {
        send "Goedemiddag"
    }
    else if (A_Hour > "18" && A_Hour < "0")
    {
        send "Goedenavond"
    }
    else
    {
        send greeting
    }
}

^x:: MsgBox("test")

