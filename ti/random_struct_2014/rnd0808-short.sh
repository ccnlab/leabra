#!/bin/sh
# parameter sweep
## 

### basic parameters
## max_ptn_len: maximum pattern length to be considered in RF analyses, max 5 (only effective when train_env == CT_TRAIN).
## (train_env is saved in gui mode, currently not set in startup yet.)
emer(){
emergent -nogui -ni -proj rnd_0808.proj rnd_init=BATCH_SEEDS tag=_batchseeds log_dir=log fts=$fts lrate=$lrate lmix=$lmix gi=$gi rel=$rel pa_num=$pa_num pa_denom=$pa_denom batches=$batches epochs=$epochs tpe=$tpe tpte=$tpte act_thr=$act_thr max_ptn_len=5
}

## *** If fts=1 (first_time_save in BatchSummary), only save dt header, then terminate.
fts=1 emer

### actual sweep of parameters
fts=0 		# append BatchSummary dt by rows
batches=2	# max_batch, number of batches, e.g., =10
epochs=4	# max_epoch, number of training epochs, e.g., =10 or 100
tpe=100 	# trials_per_epoch (trials in each training epoch), e.g., =100
tpte=100 	# trials_per_test_epoch (trials in the test epoch), e.g., = 1000
act_thr=0.8	# threshold in RF analyses

#for lrate in 0.001 0.002;do
#	for lmix in 0 1;do
#		for gi in 1.6 1.8;do
			for rel in 1 2;do
#				pa_num=1 pa_denom=4 emer
#				pa_num=1 pa_denom=3 emer
#				pa_num=3 pa_denom=7 emer
				pa_num=1 pa_denom=2 emer
#				pa_num=4 pa_denom=7 emer
			done
#		done
#	done
#done

