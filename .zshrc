export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

nvm use default


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/dpatseyuk/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="apple"
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-nvm
    fzf
    vi-mode
)

ZSH_THEME="random"

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/vi-mode-plugin/vi-mode.zsh
source $ZSH/plugins/zsh-vimode-visual/zsh-vimode-visual.zsh

bindkey -v
bindkey -M viins jj vi-cmd-mode
KEYTIMEOUT=20

gch() {
 git checkout $(git branch | fzf)
}

add-to-docs-ng () {
    npm run cli:run:make -- --makeCgUnique '20-2-20' -f $1 -c ${@:2:100} && npm run cli:run:assemble -- -f $1 && npm run ${1}:components:buildProd
}

full-build () {
    npm run cli:run:make -- --makeDefaultDocsAppComponents --makeCgUnique '20-2-20' -f $1 -c ${@:2:100} && npm run cli:run:assemble -- -f $1 && npm run ${1}:components:buildProd && npm run ${1}:docsapp:buildProd
}

full-test-build () {
    npm run cli:run:make -- -f $1 -c $2 && npm run cli:run:assemble -- -f $1 && npm run ${1}:components:buildProd && npm run ${1}:testapp:buildProd
}

t () {
    npm run ${1}:components:buildProd
}

clean() {
 npm run cli:run:clean
}

dev-clean() {
 npm run cli:dev:clean
}

dev-ng() {
 npm run cli:dev:start -- -f angular13
}

add-ng() {
 npm run cli:dev:add -- -f angular13 -c ${@:1:100}
}

dev-r() {
 npm run cli:dev:start -- -f react16
}

add-r() {
 npm run cli:dev:add -- -f react16 -c ${@:1:100}
}


dev-ng-r() {
 npm run cli:dev:start -- -f angular13 react16
}

add-ng-r() {
 npm run cli:dev:add -- -f angular13 react16 -c $1
}


compare() {
    npm run screenshots:diff \
        -- \
        --report1 ./aura-reports/*/cogen/aura-output.json \
        --report2 ./reports/aura-output.json \
        --output ./output-compare \
        --threshold 0.2 \
        --tags $1
}


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
source ~/.zsh-aliases


# Load Angular CLI autocompletion.
source <(ng completion script)
