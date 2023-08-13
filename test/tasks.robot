*** Settings ***
Documentation       Template robot main suite.



Library    OperatingSystem
Library    RPA.FileSystem

*** Variables ***
${repo}                  https://github.com/MamadouKernel/test_rpa.git
${initialisation}        git init
${remote}                git remote add origin ${repo}
${branch}                TB-01
${creation}              git checkout -b ${branch}
${message}               fin initialisation
${ajout}                 git add .
${commit}                git commit -m "${message}"
${push}                  git push origin ${branch}



*** Keywords ***
Initialisations
    [Arguments]    ${chemin}
    Run    command=cd ${chemin}
    Run    ${initialisation}
    Run    ${remote}
    Run    ${creation}
    Run    ${ajout}
    Run    ${commit}
    Run    ${push}

verifcationCreation
    ${etat_dossier}     Does Directory Not Exist    tach
    IF    ${etat_dossier}   Create Directory    tach

*** Tasks ***
Minimal task
    verifcationCreation
    ${chemin}    Absolute Path    path=tach
    Create File    path=tach/test.txt    content=Hello World
    Initialisations    ${chemin}