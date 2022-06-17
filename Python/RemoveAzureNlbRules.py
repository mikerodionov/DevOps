# Author: Mikhail Rodionov
# Description: Delete all LB rules for specific Azure LB
# Prerequisites: Linux shell + Azure CLI installed

# Set variables
NlbSubscription = ''
NlbRg = ''
NlbName = ''

import subprocess
import sys

# Confirm function
def confirm(question, default_no=True):
    choices = ' [y/N]: ' if default_no else ' [Y/n]: '
    default_answer = 'n' if default_no else 'y'
    reply = str(input(question + choices)).lower().strip() or default_answer
    if reply[0] == 'y':
        return True
    if reply[0] == 'n':
        return False
    else:
        return False if default_no else True

# Get rule names
GetRuleNames = "az network lb rule list --lb-name " + NlbName + " --resource-group " + NlbRg + " -o table | awk {'print $8'}"
RuleNames = subprocess.getoutput(GetRuleNames)
RuleNamesList = str(RuleNames).rstrip()
RuleNamesList = (RuleNamesList.split())[2:]


if confirm("We detected " + str(len(RuleNamesList)) + " LB rules on NLB " + NlbName + ". Do you want to delete all of them?") is True:
    for rule in RuleNamesList:
        RuleDelete = "az network lb rule delete -g " + NlbRg + " --lb-name " + NlbName +  " -n " + rule + " --subscription " + NlbSubscription
        try:
            subprocess.run(RuleDelete, shell=True)
            print("Deleted rule - " + rule)
        except:
            print("Failed to delete rule - " + rule)
else:
    print("Aborted")
    sys.exit(1)
