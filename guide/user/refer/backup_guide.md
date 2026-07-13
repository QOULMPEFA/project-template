# 备份指南 — 管道机器人 Mini 快速恢复

**Date:** 2026-07-07

## 设备信息

- Orange Pi Zero 2W (H616), Ubuntu 24.04, Python 3.12.3
- SSH: `<host>` → `<frp-server>:<port>`, user `<user>` / `<password>`
- 工作目录: `<workspace>`

## 快速部署流程

### 1. 系统依赖

```bash
apt update
apt install -y --allow-change-held-packages ffmpeg wiringpi python3-pip
```

### 2. wiringOP 编译（关键！apt 版不支持 Orange Pi）

```bash
cd /usr/src/wiringOP && ./build clean && ./build
gpio -v  # 验证显示 *--> OrangePi Zero2 W

# sudoers
echo "orangepi ALL=(ALL) NOPASSWD: /usr/local/bin/gpio" > /etc/sudoers.d/orangepi-gpio
chmod 440 /etc/sudoers.d/orangepi-gpio
```

### 3. Python 依赖

```bash
python3 -m pip install --break-system-packages \
    flask flask-socketio python-socketio python-engineio
```

### 4. 上传文件

```bash
# 创建目录
mkdir -p /home/orangepi/pr_mini

# 上传（本地执行）
# robot_control/, pyarmor_runtime_000000/, run_server.py → /home/orangepi/pr_mini/
# motor_sdk/ → /home/orangepi/pr_mini/motor_sdk/
```

### 5. systemd 服务

```ini
[Unit]
Description=Robot Control Panel (Encrypted)
After=network.target

[Service]
Type=simple
User=orangepi
WorkingDirectory=/home/orangepi/pr_mini
Environment=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/orangepi/.local/bin
ExecStart=/usr/bin/python3 /home/orangepi/pr_mini/run_server.py
Restart=always
RestartSec=5
StandardOutput=append:/var/log/robot_control_panel.log
StandardError=append:/var/log/robot_control_panel.log

[Install]
WantedBy=multi-user.target
```

```bash
systemctl daemon-reload
systemctl enable --now robot_control_panel.service
```

### 6. 验证

```bash
systemctl is-active robot_control_panel.service  # active
ss -tlnp | grep 6080                             # 0.0.0.0:6080
grep "Motor.*init" /var/log/robot_control_panel.log  # 左/右电机 wPi 映射
grep "ffmpeg started" /var/log/robot_control_panel.log  # 摄像头正常
```

### 7. 热点（验证通过后再开）

```ini
[Unit]
Description=PipeRobot WiFi Hotspot
After=network.target
Wants=network.target

[Service]
Type=simple
ExecStart=/usr/bin/create_ap -n --no-virt --isolate-clients -w 2 --freq-band 2.4 wlan0 AAA_Robot_mini 88888888
ExecStop=/usr/bin/create_ap --stop wlan0
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```

```bash
systemctl enable --now pipe_ap.service
# FRP 断开 — 正常。直连 AAA_Robot_mini:88888888，Web GUI http://10.42.0.1:6080
```

## 关键文件清单

| 文件 | 用途 |
|------|------|
| `run_server.py` | 系统入口（纯净版，无 dev_mode） |
| `pyarmor_runtime_000000/` | PyArmor 解密引擎（AArch64） |
| `robot_control/` | 加密的应用代码 |
| `motor_sdk/` | 电机 GPIO 驱动（未加密） |
| `systemd/pipe_ap.service` | create_ap 热点方案（v1.13 回退版） |

## 关键坑位速查

| 问题 | 解法 |
|------|------|
| gpio 报 "Unable to determine board revision" | 编译 `/usr/src/wiringOP/` |
| 电机 mock mode | 同上 + 配置 gpio sudoers |
| ffmpeg No such file | systemd 加 `Environment=PATH=...` |
| 电机松开继续转 | app.js 已改为单次发送（v1.13 起） |
| FRP 开热点后断开 | 正常——热点无互联网，直连 10.42.0.1 |
| PyArmor undefined symbol | Python 版本必须匹配 3.12 |

## 加密部署注意事项

- 本地 Python 3.12.13 (conda `robot_enc`) → Mini Python 3.12.3
- `pyarmor gen --platform linux.aarch64` 跨架构
- 加密后手动补 `templates/` 和 `static/`
- `run_server.py`、`systemd/` 手动维护在 `robot_encrypted/`
