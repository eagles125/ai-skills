---
name: mybase8_nolic
description: Use when user needs to extend myBase trial period, reset myBase trial expiration, or asks about myBase无限续期 methods
---

# myBase 无限续期

## Overview

通过删除或锁定 myBase 记录首次使用时间的配置文件参数，重置试用期。此方法不修改程序本身，仅操作配置文件。

## 配置文件路径

| 操作系统 | myBase 版本 | 配置文件路径 |
|---------|------------|-------------|
| Windows | v8.x | `C:\Users\用户名\Mybase8.ini` |
| Windows | v7.x及更早 | myBase安装目录下的 `mybase.ini` |
| macOS | v8.x | `/Users/用户名/.Mybase8.ini` (隐藏文件) |
| macOS | v7.x及更早 | `/Users/用户名/.mybaseX.ini` (X=版本号, 隐藏文件) |

## 操作步骤

### 1. 准备工作
- **完全关闭 myBase 软件**

### 2. 删除时间戳参数

用文本编辑器打开对应 `.ini` 文件，删除以下行：

| 版本 | 查找并删除 |
|-----|----------|
| v8.x | `FirstUseOn.UserLic.App=*****` 整行 |
| v7.x及更早 | `App.UserLic.FirstUseOn=*****` 整行 |

保存文件。若权限受限无法修改，可直接删除整个 `.ini` 文件，myBase 会在下次启动时自动生成新配置。

### 3. 锁定配置文件（无限续期）

**原理：** 时间戳参数后的数字是 Unix 时间戳，软件通过比较该值与当前时间判断过期。让值为空则无从判断。

**方法一 - 文件只读锁定：**
- 修改保存后，将 `Mybase8.ini` 属性设为"只读"
- 或用"火绒安全"等软件设置文件保护规则，阻止写入

**方法二 - 自动化脚本：**
编写开机自动脚本删除时间戳行，无需人工干预。

## 常见问题

| 问题 | 解决方案 |
|-----|---------|
| 找不到配置文件 | macOS用 `ls -a` 显示隐藏文件；Windows检查用户目录 |
| 修改后仍过期 | 检查是否正确删除整行（包括参数名和值） |
| 权限不足删除文件 | macOS用 `sudo`；Windows以管理员身份运行记事本 |

## 注意事项

- 此方法仅用于个人评估，正式使用建议购买正版
- 每次试用期到期后需重新操作（除非已锁定文件）
- macOS隐藏文件可在终端用 `ls -a` 查看