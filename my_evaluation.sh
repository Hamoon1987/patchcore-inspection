datapath=mvtec
loadpath=results/MVTecAD_Results

# modelfolder=IM320_Ensemble_L2-3_P001_D1024-384_PS-3_AN-1
# modelfolder=IM224_Ensemble_L2-3_P001_D1024-384_PS-3_AN-1
modelfolder=IM224_WR50_L2-3_P01_D1024-1024_PS-3_AN-1_S0
savefolder=evaluated_results'/'$modelfolder

datasets=('bottle')
model_flags=($(for dataset in "${datasets[@]}"; do echo '-p '$loadpath'/'$modelfolder'/models/mvtec_'$dataset; done))
dataset_flags=($(for dataset in "${datasets[@]}"; do echo '-d '$dataset; done))

python bin/load_and_evaluate_patchcore.py --gpu 0 --seed 0 $savefolder \
patch_core_loader "${model_flags[@]}" \
dataset --resize 256 --imagesize 224 "${dataset_flags[@]}" mvtec $datapath
