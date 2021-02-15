data <- data.frame(LVR = log(c(1.11, 1.11, 1.13, 1.16, 1.15, 1.17, 1.16, 1.13, 1.18, 1.1, # CA
                               1.13, 1.14, 1.07, 1.11, 1.11, 1.15, 1.14, # CT
                               1.12, 1.08, 1.11, 1.15, 1.17, 1.19, 1.16, 1.14, # IN
                               1.06, 2.39, 1.76, # KY
                               1.1, .94, 1.05, 1.09, 1.16, 1.07, 1.23, # MN
                               1.12, 1.09, 1.15, 1.18, 1.18, 1.19, 1.22, # MO
                               1.17, 1.09, 1.16, # NJ
                               1.03, 1.04, 1.09, 1.08, 1.11, 1.08, 1.17, # NM
                               1.03, 1.15, 1.24, 1.24, 1.24, 1.14, 1.35, # WV
                               1.03, 1.12, 1.07, 1.1, 1.1, 1.11, 1.3)), # WY
                   N = c(460980, 463969, 470963, 479802, 481557, # CA
                         481275, 472790, 498613, 409453, 337126, # CA
                         41558, 42308, 42108, 43025, 43828, 43944, 42255, # CT
                         77097, 77362, 78818, 79023, 79905, 80854, 81925, 80674, # IN
                         48956, 50474, 40669, # KY
                         57403, 57235, 58553, 59741, 62345, 63428, 62526, # MN
                         64434, 64979, 65835, 66745, 70328, 72176, 67723, # MO
                         103796, 103915, 107115, # NJ
                         24685, 24372, 24758, 25153, 25548, 25987, 27691, # NM
                         19549, 19657, 20466, 20779, 21112, 21500, 19486, # WV
                         6199, 6279, 6063, 6416, 6669, 6826, 6060)) # WY

tiff(filename = 'log improvement.png', width = 10.5, height = 9,
     units = 'in', pointsize = 14, bg = 'white', res = 300) # image file

ggplot(data, aes(x = LVR, y = N)) +
  geom_point(colour = '#FF6C00', shape = 1, size = 5) +
  ggtitle('Variance Ratios and Sample Sizes') +
  theme(text = element_text(family = 'Optima', size = 14),
        panel.background = element_rect(fill = alpha('#45BCFF', .15)),
        plot.title = element_text(hjust = .5),
        plot.caption = element_text(size = 9.5, hjust = .5, margin = margin(t = 15))) +
  labs(x = 'Variance Ratio', y = 'Sample Size') +
  scale_x_continuous(breaks = c(-log(1.1), log(seq(1, 2.4, .2))),
                     minor_breaks = c(-log(1.1), log(seq(1, 3, .1))),
                     labels = c(1.1, seq(1, 2.4, .2)), limits = c(-log(1.07), log(2.4))) +
  scale_y_continuous(breaks = 1000*c(5, 10, 20, 30, 40, 50, 100, 200, 300, 400, 500),
                     minor_breaks = 1000*c(5, 10, 20, 30, 40, 50, 100, 200, 300, 400, 500),
                     labels = c('5K', '10K', '20K', '30K', '40K', '50K',
                                '100K', '200K', '300K', '400K', '500K'),
                     limits = c(5000, 500000), trans = 'log') +
  geom_vline(xintercept = 0, linetype = 'longdash', color = alpha('gray', .8))

dev.off() # write image to working directory





