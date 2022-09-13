---
title: Nodejs setup with NVM
author: Kaiyom
date: 2022-04-20 06:30:00 -0000
categories: [environment-setup]
tags: [nodejs,npm,setup]
---

## NVM (Node Version Manager) installation (here) [https://github.com/nvm-sh/nvm#install--update-script]

## Use NVM

List of available Node version
```bash
nvm ls-remote
```

Install LTS (Long Term Support) Nodejs 
```bash
nvm install --lts
```

Start using LTS (Long Term Support) Nodejs 
```bash
nvm use --lts
```

Check current node version
```bash
node -v
```

Check current npm version
```bash
npm -v
```

Install yarn 
```bash
npm install --global yarn
```

> Know more about available NVM flags (here)[https://ostechnix.com/install-node-js-linux/]
