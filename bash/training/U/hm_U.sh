#!/bin/bash

# Allows for quick test runs - Set topk to e.g. 20 & midsave to 5
topk=${1:--1}


# 50 Feats, Seed 43
# cp ./data/hm_vgattr5050.tsv ./data/HM_img.tsv

# uniter-large.pt

python3 hm.py --seed 43 --model U \
--train train --valid dev_seen --test dev_seen --lr 1e-5 --batchSize 8 --tr bert-large-cased --epochs 5 --tsv \
--num_features 36 --loadpre ./data/uniter-large.pt --num_pos 6 --contrib --exp U50 --topk $topk

# uniter-large.pt
python3 hm.py --seed 43 --model U \
--train traindev --valid dev_seen --test test_seen,test_unseen --lr 1e-5 --batchSize 8 --tr bert-large-cased --epochs 5 --tsv \
--num_features 36 --loadpre ./data/uniter-large.pt --num_pos 6 --contrib --exp U50 --topk $topk

# # 72 Feats, Seed 86
# cp ./data/hm_vgattr7272.tsv ./data/HM_img.tsv

# python hm.py --seed 86 --model U \
# --train train --valid dev_seen --test dev_seen --lr 1e-5 --batchSize 8 --tr bert-large-cased --epochs 5 --tsv \
# --num_features 72 --loadpre ./data/uniter-large.pt --num_pos 6 --contrib --exp U72 --topk $topk

# python hm.py --seed 86 --model U \
# --train traindev --valid dev_seen --test test_seen,test_unseen --lr 1e-5 --batchSize 8 --tr bert-large-cased --epochs 5 --tsv \
# --num_features 72 --loadpre ./data/uniter-large.pt --num_pos 6 --contrib --exp U72 --topk $topk


# # 36 Feats, Seed 129
# cp ./data/hm_vgattr3636.tsv ./data/HM_img.tsv

# python hm.py --seed 129 --model U \
# --train train --valid dev_seen --test dev_seen --lr 1e-5 --batchSize 8 --tr bert-large-cased --epochs 5 --tsv \
# --num_features 36 --loadpre ./data/uniter-large.pt --num_pos 6 --contrib --exp U36 --topk $topk

# python hm.py --seed 129 --model U \
# --train traindev --valid dev_seen --test test_seen,test_unseen --lr 1e-5 --batchSize 8 --tr bert-large-cased --epochs 5 --tsv \
# --num_features 36 --loadpre ./data/uniter-large.pt --num_pos 6 --contrib --exp U36 --topk $topk

# # Simple Average
python utils/ens.py --enspath ./data/ --enstype sa --exp U36 # 5072