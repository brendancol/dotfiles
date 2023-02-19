export ZSH="/Users/brendan/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
export PGDATA='/usr/local/var/postgresql@14'

ZSH_THEME="robbyrussell"

GH_EDITOR="nvim"
EDITOR="nvim"
VISUAL="nvim"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=~/miniconda3/bin:$PATH

# Create Github Issue
declare -A GITHUB_USERS=(
  ["me"]="brendancol"
  ["brendan"]="brendancol"
  ["gian"]="giancastro"
  ["filipe"]="jam-lock"
  ["pablo"]="pablomakepath"
  ["timo"]="tcmetzger"
  ["thuy"]="thuydotm"
  ["victoria"]="vicade-mp"
)

declare -A SLACK_USERS=(
  ["me"]="brendan"
  ["brendan"]="brendan"
  ["gian"]="Gian Castro"
  ["filipe"]="Filipe"
  ["pablo"]="Pablo"
  ["timo"]="Timo"
  ["thuy"]="Thuy"
  ["victoria"]="Victoria"
)


ghi() {
  local title="$1"
  local body="$2"
  local input_assignee="${3:-me}"
  local assignee=${GITHUB_USERS[$input_assignee]}
  local slack_assignee=${SLACK_USERS[$input_assignee]}


  local response=$(gh issue create --title "$title" --body "$body" --assignee "$assignee")

  if [ $? -ne 0 ]; then
    echo "Error: Issue creation failed."
    return 1
  fi
  local issue_url=$(echo "$response" | grep "http")
  echo "Issue URL: $issue_url"
  local message="Hey @$slack_assignee, I just assigned this issue to you: $issue_url"
  echo "SLACK MESSAGE: $message"

}


# Create git branch based on github issue number
function issue_branch {
  issue_number=$1

  # get the issue title using the gh command
  issue_title=$(gh issue view $issue_number | head -n 1 | awk '{$1="";print tolower($0)}' | xargs echo -n)

  # remove any spaces from the issue title and replace them with hyphens
  branch_name=$(echo $issue_title | tr ' ' '-')
  branch_name="fixes-$issue_number-$branch_name"

  # check if the branch already exists
  if git show-ref --verify --quiet refs/heads/$branch_name; then
    # if it does, switch to that branch
    git checkout $branch_name
  else
    # if it doesn't, create a new branch with the specified name
    git checkout -b $branch_name
  fi
}

alias git-issue-branch='issue_branch'
