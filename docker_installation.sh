#!/bin/bash
#disk size 
sudo growpart /dev/xvda 4
sudo vgs
sudo lvextend -l +100%FREE /dev/mapper/RootVG-varVol
sudo xfs_growfs /var
if [$? -ne 0]; than
echo "DIsk space allocation failed"
exit 1
else
echo "DIsk space allocation success"
fi

sudo lsblk
#docker installation
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable --now docker

if [$? -ne 0]; than
echo "Docker not intalled"
exit 1
else
echo "Docker installation  success"
fi

sudo usermod -aG docker ec2-user

exit


