### Analyses: Drivers of soil biological activity across global grasslands ###


## Figure 1: Treatment effects on soil detritivore and microbial activity ##

# Model bait lamina test
detritivores <- lmer(Bait lamina test ~ NPK * Exclosure * Years of treatment + (1|site_code/block) + (1|days_inserted), data=data)
anova(detritivores)

# Model microbial activity
microbes <- lmer(Microbial activity ~ NPK * Exclosure * Years of treatment + (1|site_code/block) + (1|days_inserted), data=data)
anova(micorbes)



## Figure 2 & 3: Structural equation model ##

nutnet.sem1 <- psem(
  lmer(logtotal_mass ~ fert + Exclose + logH2O_fresh + logMAP  + (1|site_code/block) + (1|year_trt_corrected), data=data),
  lmer(logrich ~ fert + Exclose + logMAP + (1|site_code/block) + (1|year_trt_corrected), data=data),
  lmer(logH2O_fresh ~ fert * Exclose + logMAP + (1|site_code/block) + (1|year_trt_corrected), data=data),
  lmer(logBasal ~ fert + Exclose + logtotal_mass + logMAP + logrich + logH2O_fresh + (1|site_code/block) + (1|year_trt_corrected) + (1|O2_Device), data=data),
  logtotal_mass %~~% logrich
)

summary(nutnet.sem1)

## The plot was made manually using Inkshape
