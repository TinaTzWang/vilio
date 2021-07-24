from fts_tsv.hm_data_tsv import load_obj_tsv
import pandas as pd
path = '/content/drive/MyDrive/meme_project/hateful_memes/'

ids = []
with open(path+"hm_vgattr3636.tsv") as f:
    for row in f:
        ids.append(int(row.split('\t')[0]))
print(len(ids))
print(ids[0])
test_data = load_obj_tsv(
  path+"hm_vgattr3636.tsv"
  , ids=ids)
test_data = pd.DataFrame(test_data)
test_data.to_csv(path+'hm_vgattr3636_parsed_output.csv')