# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jzd/.oh-my-zsh"



export PPP="/Users/jzd/Movies/layer/0.txt"



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




alias python='python3'










cd_up(){
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
cd_current(){
  cd "$(dirname "$1")" && pwd
}
ccdc_fiire(){
  cd "$(dirname "$1")" && pwd
  gcc "$(basename "$1")"  -o fork -std=c99 -Wall -Werror && ./fork  
}
cdl_fire(){
 cd "$(dirname "$1")" && pwd && ls -lh
}
open_c(){
  open "$(dirname "$1")"
}
open_side(){
  open "$(dirname "$1")/.."
}
cd_side(){
  cd "$(dirname "$1")/.." && pwd
}
cd_side_git(){
  cd $(dirname "$1") && git add . && pwd
}
open_vs(){
   open "/$HOME//Downloads/Visual Studio Code.app";
}
alias openn="open ."
deal_git_commit(){
   if [ "$#" -ne 2 ]; then
       if [[ -d $1 ]]; then
	   echo "Error, 有错误"
       else
	   git add . && pwd  && git commit -m $1 && git push
       fi
   else
       if [[ -d $1 ]]; then
           cd "$1" && git add . && pwd  && git commit -m $2 && git push
       elif [[ -f $1 ]]; then
           cd $(dirname "$1") && git add . && pwd  && git commit -m $2 && git push
       fi
   fi
}
git_ignore(){
   if [ "$#" -ne 1 ]; then
        cd "$(dirname "$1")" && pwd && \
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
   else
        pwd && \
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
   fi
}
identify_frame(){
  identify -verbose $1 | grep Geometry
}
converto(){
  cd "$(dirname "$1")" && pwd
  First="${2%[xX]*}"
  Fourth="${2##*+}"
  Lhs="${2%%+*}"
  Rhs="${2#"$Lhs+"}"
  Second="${Lhs##*[xX]}"
  Third="${Rhs%+*}"
  
  ((width = First * 3 / 2))
  ((height = Second * 3 / 2)) 
  ((posX = Third * 3 / 2)) 
  ((posY = Fourth * 3 / 2)) 
  Final="${width}X${height}+${posX}+${posY}"
  # echo $Final
  rawThree="${1##*/}"
  rawThree="${rawThree%@*}"
  rawThree="${rawThree}@3x.png"
  # echo $rawThree
  convert $1 -crop $2 "two@2x.png" && convert $rawThree -crop $Final "three@3x.png"
}



convertr(){
  cd "$(dirname "$1")" && pwd
  fileName="$(basename "$1")"
  newInstance="resized${fileName}.png"
  if [ "$#" -eq 2 ]; then
        newInstance="resized${2}.png"
        convert $1 -resize $2x$2  "$newInstance"  && identify -verbose "$newInstance"  | grep Geometry
  elif [ "$#" -eq 1 ]; then
        convert $1 -resize 25%  "$newInstance"  && identify -verbose "$newInstance"  | grep Geometry
  fi
}






converta(){
  cd "$(dirname "$1")" && pwd
  for f in *.png; do
     newInstance="resized$(basename "$f")" 
     convert $f -resize $2  "$newInstance" && convert "$newInstance" -crop $2X$3  "$newInstance"  && identify -verbose  "$newInstance"  | grep Geometry
  done
}
identify_all_frame(){
  cd "$(dirname "$1")" && pwd
  for f in *.png; do
     echo "File -> $f $(identify -verbose "$f" | grep Geometry) \n" 
  done
}

youtubeF(){
   echo "$1"
   youtube-dl -F "$1"
}
youtube1(){
  youtube-dl -f 140 "$1"
}
youtube2(){
  youtube-dl -f 22  "$1"
}
xibd_fire(){
   cd "$(dirname "$1")/.." && pwd
   find . -type f  '(' -name '*.storyboard' -o -name '*.xib' ')' -exec  \
sed -E -i '' 's@\<fontDescription key=\"fontDescription\" type=\"system\" pointSize=\"([0-9]+)\"/>@<fontDescription key=\"fontDescription\" name=\"PingFangSC-Regular\" family=\"PingFang SC\" pointSize=\"\1\"\/>@' {} +
 
}

codeA_fire(){
   git remote add origin "$1"
}

codingn(){
   pwd
   git init && git remote add origin "$1" && git add . && git commit -m "start" &&  git push --set-upstream origin master && git remote -v
}
alias 'con'='codingn'
codingne(){
   pwd
   git remote add deng $1 && git push $1
}



codingnd(){
   pwd
    git init && git remote add origin "$1" && git add . && git commit -m "start" &&   git checkout -b "$(basename "`pwd`")"   &&    git push --set-upstream origin "$(basename "`pwd`")"  && git remote -v
}
alias 'cod'='codingnd'


alias 'cone'='codingne'
alias 'utubeF'='youtubeF'
alias 'utube1'='youtube1'
alias 'utube2'='youtube2'
alias 'cdc'='cd_current'
alias 'cdu'='cd_side'
alias 'openu'='open_side'
alias 'openc'='open_c'
alias 'cdup'='cd_up'
alias 'openvs'='open_vs'
alias 'cdug'='cd_side_git'
alias ll="ls -lh"
alias cdl="cdl_fire"
alias gitp="git push"
alias gitc='deal_git_commit'
alias g='git'
alias gst='git status'
alias 'imgw'='identify_frame'
alias 'imgaw'='identify_all_frame'

alias 'imgo'='converto'
alias 'imgr'='convertr'
alias 'imga'='converta'
alias 'xibd'='xibd_fire'
alias 'ccdc'='ccdc_fiire'
alias h=history
alias c=clear
alias ll="ls -lh"
alias ddd="cd ~/Library/Developer/Xcode/DerivedData"
alias cdd="cd /Users/dengjiangzhou/Desktop"
alias flud="flutter doctor"
alias vimz="vim ~/.zshrc"
alias savez=". ~/.zshrc"
alias catz="cat ~/.zshrc"

alias openz="open ~/.zshrc"

alias catb="open ~/.bash_profile"
alias openb="open ~/.bash_profile"
alias vimb="vim ~/.bash_profile"
alias save="source ~/.bash_profile"





alias fluda=" flutter doctor  --android-licenses="
alias giti="git_ignore"
chrom_fire(){
  open -a "Google Chrome"
}
alias chrom="chrom_fire"
chrome_fire(){
   if [ "$#" -eq 1 ]; then
       open -a "Google Chrome" "$1" 
   else
       open -a "Google Chrome" http://stackoverflow.com
   fi
}
alias chrome="chrome_fire"


chromc(){
  open -a "Google Chrome" https://dev.tencent.com/user/projects 
}

alias coding="chromc"


chromeLeet(){
   open -a "Google Chrome" "https://leetcode.com/problemset/all/#"
   open -a "safari" "https://leetcode-cn.com/problemset/all/"

}

alias leetcode=chromeLeet

safari_fire(){
  open -a "safari" http://stackoverflow.com
}
alias safari="safari_fire"
safarig_fire(){
  open -a "safari"  "http://git.ztosys.com/AppPlatform/ZTBest-ios/commits/developer"
}
alias safarig="safarig_fire"



convert_change(){
   cd "$(dirname "$1")" && pwd	
   name="$(basename "$1")"
   echo $name
   echo $2
   convert $1 -resize $2x$2 "${2}_${name}"
   identify -verbose "${2}_${name}" | grep Geometry
}
alias imgch="convert_change"



alias releaseflu="flutter build ios --release"
gitbr_fire(){
   git checkout --track origin/$1
}
alias gitbr="gitbr_fire"
gitlf_fire(){
   git log --follow -p -- "$1"
}
alias gitlf="gitlf_fire"
gitch_fire(){
   git checkout -- "$1"
}
alias gitch="gitch_fire"






alias gitlin="git clean  -d  -f ."


flutterb(){
  
   flutter clean &&  flutter build ios
}
alias  'flutter255'="flutterb"
alias  'gitpa'='git push https://BoxDengJZ:box494949@github.com/BoxDengJZ/AVFoundation_ray.git'

alias 'gitb'="git branch"



gittwoDe(){
    git branch | grep  "^[^\*]" |  xargs git checkout
}

alias 'gitwo'="gittwoDe"



gitpuDe(){
    if [ "$#" -eq 1 ]; then
        git push --set-upstream $1  "$(git branch | grep \* | cut -d ' ' -f2)"
    else
        git push --set-upstream origin "$(git branch | grep \* | cut -d ' ' -f2)"
    fi
}

alias  'gitpu'="gitpuDe"




last_fire(){
    if [ "$#" -eq 1 ]; then
        history | tail -$1
    else
        history | tail -25
    fi
}

alias  'last'="last_fire"

alias  'large'="du -sh * | grep M   | sort -nr | head -3"
alias  'codeA'="codeA_fire"


alias  'caru'="carthage update"

alias  'comment'="bash /Users/jzd/Music/learn_git/随手写的/little/1.sh"


alias  'gitcfl'="git config -l"

alias  'gitd'="git diff"


blue(){
   convert -size 100x100 xc:"#8a2be2" blue@2x.png
}

alias  'blu'="blue"

alias  'gg'="sudo shutdown -h now"



alias gdca='git diff --cached' # diff between your staged file and the last commit

alias gdcc="git diff HEAD{,'^'}" # diff between your recent tow commits

alias gdf="git diff HEAD{'^',}" # diff between your recent tow commits


imgcut_fire(){
   convert "$1" -crop 250x250+0+0  crop.png
}


alias imgcut="imgcut_fire"


img_circle(){
   Width=$1
   ((Radius = $Width / 2))
   convert -size ${Width}x${Width} xc:"#EFEFEF" blue@2x.png
   convert -size ${Width}x${Width} xc:none -fill blue@2x.png -draw "circle ${Radius},${Radius} ${Radius}, 1" circle_pure@2x.png	
}

alias circle="img_circle"


img_circle_d(){
   Width=$1
   ((Radius = $Width * 0.5))
   convert -size ${Width}x${Width} xc:"#0080FF" blue@2x.png
   convert -size ${Width}x${Width} xc:none -fill blue@2x.png -draw "circle ${Radius},${Radius} ${Radius},1" circle_pure@2x.png   
   convert circle_pure@2x.png -resize 150% circle_pure@3x.png	
   rm blue@2x.png
}

alias cirr="img_circle_d"


img_circle_ee(){
   Width=$1
   ((Radius = $Width * 0.5))
   StrokeW=2
   convert -size ${Width}x${Width} xc:none blue@2x.png
   convert -size ${Width}x${Width} xc:none -fill blue@2x.png  -stroke xc:"#979797" -strokewidth ${StrokeW} -draw "circle ${Radius},${Radius} ${Radius},${StrokeW}" circle_pure@2x.png	
   ((Width_d = $Width * 1.5))
   ((Radius_d = $Width_d * 0.5))
   convert -size ${Width_d}x${Width_d} xc:none blue@3x.png
   convert -size ${Width_d}x${Width_d} xc:none -fill blue@3x.png  -stroke xc:"#979797" -strokewidth ${StrokeW} -draw "circle ${Radius_d},${Radius_d} ${Radius_d},${StrokeW}" circle_pure@3x.png
   
   rm blue@2x.png
   rm blue@3x.png 
}

alias cire="img_circle_ee"


imgTwoClass(){
   Radius=$1
   StrokeW=3
   ((Width = $Radius * 2))
   ((StrokeW_second = $StrokeW * 2))
   convert -size ${Width}x${Width} xc:none  \
          -draw "fill \"#FFFFFF\"  circle ${Radius},${Radius} ${Radius},0
                 fill \"#FF2D55\"  circle ${Radius},${Radius} ${Radius},${StrokeW_second}" circle_pure@2x.png
   convert circle_pure@2x.png -resize 150% circle_pure@3x.png	
}

alias cirtw="imgTwoClass"




img_circle_ddd(){
   Width=$1
   DIR=$2
   ((Radius = $DIR * 0.5))
   ((Center = $Width * 0.5))
   ((X = $Center + $Radius))
   convert -size ${Width}x${Width} xc:"#FFC459" blue@2x.png
   convert -size ${Width}x${Width} xc:none -fill blue@2x.png -draw "circle ${Center},${Center} ${X},${Center}" circle_pure@2x.png	
   ((Width_d = $Width * 1.5))
   ((Center_d = $Width_d * 0.5))
   ((Radius_d = $Radius * 1.5))
   ((X_d = $Center_d + $Radius_d))
   convert -size ${Width_d}x${Width_d} xc:"#FFC459" blue@3x.png
   convert -size ${Width_d}x${Width_d} xc:none -fill blue@3x.png -draw "circle ${Center_d},${Center_d} ${X_d},${Center_d}" circle_pure@3x.png
   rm blue@2x.png
   rm blue@3x.png
}

# crrr 160 80


alias crrr="img_circle_ddd"

imgCircle(){
    Width=$1
    ((Radius = $Width / 2))
    convert -size  ${Width}x${Width}  xc:none -fill xc:"#D8D8D8"  -draw  "circle ${Radius},${Radius} ${Radius}, 1"   circle_pure@2x.png	
}


imgTransparent(){
    Width=$1
    ((Radius = $Width / 2))
    ((WidthScalse = Width * 3 / 2))
    ((RadiusScalse = WidthScalse / 2))
    convert -size  ${Width}x${Width}  xc:none -fill xc:transparent  -draw  "circle ${Radius},${Radius} ${Radius}, 1"   blank@2x.png	
    convert -size  ${WidthScalse}x${WidthScalse}  xc:none -fill xc:transparent  -draw  "circle ${RadiusScalse},${RadiusScalse} ${RadiusScalse}, 1"   blank@3x.png
}

alias cir="imgCircle"

alias blank="imgTransparent"

git_Search(){
    git log -p -S $1  
}

alias gitSearch="git_Search"

git_sear(){
    git log -p  --grep $1
}

alias gitsear="git_sear"


batchRename(){
  n=0
  for d in */ ; do
      ( cd "$d" && for f in * ; do mv  "$f" $n"_$f" ; done )
      (( n++ ))
  done
}

alias renameB="batchRename"


batchRenameCancle(){
   for d in */ ; do
       ( cd "$d" && for f in * ; do  name=$(echo $f |  sed -e 's/[0-9]_//g' ) ; mv  "$f" "$name" ; done )
   done
}

alias renameC="batchRenameCancle"


named_fire(){
   for f in *.png ; do mv  "$f" "$1_$f" ; done
}

alias named="named_fire"


alias lsc="ls | wc -l "

alias lsd="ls -d */"

alias oldb="open ~/.lldbinit"


gitShow(){
   git tag -l --format='%(tag) %(subject)'
}

alias tagS="gitShow"



#!/bin/bash
# For git commands
export PATH=$PATH:/Users/jzd/Documents/gitScripts
# Other existing export statements.
# End of file

