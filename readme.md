> 项目地址：https://github.com/lakeoffaith/zsSysDemo
> 注册github账号，并在本地安装git

- fork项目
> 点击fork,进入你的项目 https://github.com/xxxx/zsSysDemo
> 在自己本地git clone https://github.com/xxxx/zsSysDemo

- 进入 zsSysDemo 文件夹 添加远程地址

```
git remote add upstream https://github.com/lakeoffaith/zsSysDemo
```

- 获取最新代码

```
git pull upstream master
```

**创建分支**
- 好了, 现在可以开始贡献我们的代码了 按照国际惯例, 我们一般不在 master 上提交新代码, 而需要为新增的功能或者fixbug建立新分支, 再合并到 master 上, 使用以下代码创建分支

```
git checkout -b branch1
```

- 分支修改代码，
```
git commit -a -m "new commit"
```

**合并修改**
- 一个常见的问题是远程的 upstream (swoole/swoole-src) 有了新的更新, 从而会导致我们提交的 Pull Request 时会导致冲突, 因此我们可以在提交前先把远程其他开发者的commit和我们的commit合并.
- 使用以下代码切换到 master 分支:
```
git checkout master
```

- 使用以下代码拉出远程的最新代码:
```
git pull upstream master
```

- 切换到branch1
```
git checkout branch1
```

- 把 master 的 commit 合并到 branch1:
```
git rebase master
```

- 把更新代码提交到自己的 branch1 中:
```
git push origin branch1
```

**Pull Request**
- 提交 Pull Request
你可以在你的 github 代码仓库页面切换到 branches 页面点击 branch1 分支后点击 New pull request 按钮, 添加相关注释后提交.
OR
切换到 branch1 分支的代码仓库点击 Compare & pull request 按钮, 添加相关注释后提交.

