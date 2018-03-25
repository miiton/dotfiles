# How to setup

## fish

```sh
brew install fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

install [jorgebucaran/fisher: A package manager for the fish shell](https://github.com/jorgebucaran/fisher)

## git-secrets

```sh
brew install git-secrets
git secrets --register-aws --global
```

## R ggplot sample

```r
 ggplot(diamonds,aes(x=carat,y=price,colour=cut)) +
     geom_point(alpha=0.5) +
     my_ggtheme() +
     scale_color_manual(values=univ_colors) +
     ggtitle("ggplot sample")
```

![Sample](sample_plot.png)
