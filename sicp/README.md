### SICP的JS版本

想读sicp 发现不仅最新出了JavaScript版本，还有个和原版的对比版本，web版不同之处用不同颜色字体做了清晰的对比，地址在这：

[GitHub - source-academy/sicp: XML sources of SICP and SICP JS, and support for generating Interactive SICP JS, PDF, e-book and comparison editions](https://github.com/source-academy/sicp)

VScode 使用Scheme的环境配置

1. [下载Chez Scheme](https://github.com/cisco/ChezScheme/releases/tag/v9.5.4)

2. 添加到环境变量
   
   > 默认的安装路径在：
   > 
   > C:\Program Files\Chez Scheme 9.5.4\bin\ta6nt (64)  
   > C:\Program Files (x86)\Chez Scheme 9.5.4\bin\ti3nt (32）

3. 安装VScode 扩展
   
   vscode-scheme,Code Runner

4. 在用户配置`settings.json`中加入
   
   ```json
   "code-runner.runInTerminal": true,
   "code-runner.executorMapByFileExtension": {
   ".ss": "scheme"
   },
   "code-runner.executorMap": {
       "scheme": "scheme"
   },
   ```

5. **注意：在设置完成后要重启VScode**

6. 现在可以运行后缀为.ss的scheme程序
   
   ```scheme
   (display "Hello")
   (exit)
   ```
   
   `(exit)`是为了离开与`terminal`的交互

7. 可以安装Rainbow Brackets 改善括号地狱

8. 关于缩进无法对齐的问题参考：
   
   https://zhuanlan.zhihu.com/p/262180614
