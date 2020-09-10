mode con cols=80 lines=2
set a=0
set good=0
set bad=0
set total=0
set per=0
set tmp=0
set n0=0
set n1=0
set n2=0
set n3=0
set n4=0
set n5=0
set n6=0
set n7=0
set n8=0
set n9=0
set n10=0
set n11=0
set n12=0
set n13=0
set n14=0
set n15=0
set n16=0
set n17=0
set n18=0
set n19=0
set n20=0
set n21=0
set n22=0
set n23=0
set n24=0
set n25=0
set n26=0
set n27=0
set n28=0
set n29=0
set n30=0
set n31=0
set n32=0
set n33=0
set n34=0
set n35=0
set n36=0
set n37=0
set n38=0
set n39=0
set n40=0
set n41=0
set n42=0
set n43=0
set n44=0
set n45=0
set n46=0
set n47=0
set n48=0
set n49=0
set n50=0
set n51=0
set n52=0
set n53=0
set n54=0
set n55=0
set n56=0
set n57=0
set n58=0
set n59=0
set n60=0
set n61=0
set n62=0
set n63=0
set n64=0
set n65=0
set n66=0
set n67=0
set n68=0
set n69=0
set n70=0
set n71=0
set n72=0
set n73=0
set n74=0
set n75=0
set n76=0
set n77=0
set n78=0
set n79=0
set n80=0
set n81=0
set n82=0
set n83=0
set n84=0
set n85=0
set n86=0
set n87=0
set n88=0
set n89=0
set n90=0
set n91=0
set n92=0
set n93=0
set n94=0
set n95=0
set n96=0
set n97=0
set n98=0
set n99=0
set host=%1

:loop
@echo off
ping %host% -n 1 > nul
echo off
set /a tmp=n%a%
:echo n%a% %tmp%
if %tmp% EQU 1 (
    set /a good=good-1
) else if %tmp% EQU 2 (
    set /a bad=bad-1
)

@echo off
if %errorlevel% NEQ 0 (
    :echo bad %bad%
    set /a bad=bad+1
    if %bad% GTR 100 (
        set /a bad=100
        echo bad is greater than 100
    )
    set /a n%a%=2
) else (
    :echo good %good%
    set /a good=good+1
    if %good% GTR 100 (
        set /a good=100
        echo good is greater than 100
    )
    set /a n%a%=1
)

set /a total=good+bad
:echo total %total%
set /a per=good*100/total
echo %host% reachability is %per%%%

if %per% GTR 95 (
    color 20
) else if %per% GTR 80 (
    color e0
) else if %per% GTR 60 (
    color 60
) else if %per% GTR 30 (
    color c0
) else (
    color 40
)

set /a a=a+1
:echo %a%
if %a% GEQ 100 (
    set /a a=0
)

timeout/T 1 > nul
goto loop

