TARGET="uracil"
LR=5e-4
ENERGY_COEFFICIENT=1
FORCE_COEFFICIENT=20

DENOISING_POS_PROB=0.25
DENOISING_POS_STD=0.05
DENOISING_POS_WEIGHT=5.0
DENOISING_CORRUPT_RATIO=0.25

OUTPUT_DIR="models/md17/equiformer_dens/N@6_L@2_C@128-64-32/target@uracil/lr@5e-4_wd@1e-6_epochs@1500_w-f2e@20_exp@32_l2mae-loss/denoising-prob@0.25-std@0.05-coefficient@5.0-linear-decay-corrupt-ratio@0.25"

CONFIG_PATH="md17/configs/equiformer_dens/equiformer_dens_N@6_L@2_C@128-64-32.yml"


python main_md17_dens.py \
    --output-dir $OUTPUT_DIR \
    --config-yml $CONFIG_PATH \
    --target  $TARGET \
    --data-path 'datasets/equiformer/md17' \
    --epochs 1500 \
    --lr $LR \
    --batch-size 8 \
    --eval-batch-size 8 \
    --weight-decay 1e-6 \
    --energy-weight $ENERGY_COEFFICIENT \
    --force-weight $FORCE_COEFFICIENT \
    --denoising-pos-prob $DENOISING_POS_PROB \
    --denoising-pos-weight $DENOISING_POS_WEIGHT \
    --denoising-pos-std $DENOISING_POS_STD \
    --denoising-corrupt-ratio $DENOISING_CORRUPT_RATIO \
    --use-denoising-pos-weight-linear-decay \
    --test-interval 20 \
    --test-max-iter 500
    
#    --checkpoint-path $CHECKPOINT_PATH
#    --evaluate