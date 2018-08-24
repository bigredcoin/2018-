import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn.neural_network import MLPClassifier as mlp
from sklearn.utils import shuffle

# 从CSV文件读取训练数据
df = pd.DataFrame(pd.read_csv('/mnt/sd01/sjjs_bj14/contest1/contest1_training.csv',header=None))
x_train = df.ix[:,1:]   # 第2列往后是数据
y_train = df.ix[:,0]    # 第1列是标签
# 归一化
min_max_scaler = preprocessing.MinMaxScaler()
x_tr_arr = x_train.values
x_tr_scaled = min_max_scaler.fit_transform(x_tr_arr)
x_train = pd.DataFrame(x_tr_scaled)
# 开始训练
model = mlp(activation='tanh',solver='adam',alpha=0.0001,learning_rate='adaptive',learning_rate_init=0.001,max_iter=200)
model.fit(x_train,y_train)
# 从CSV文件读取测试数据
df = pd.DataFrame(pd.read_csv('/mnt/sd01/sjjs_bj14/contest1/contest1_forecast.csv',header=None))
x = df.ix[:,1:] # 第2列往后是数据
label = df.ix[:,0]  # 第1列是标签
# 归一化
x_arr = x.values
x_scaled = min_max_scaler.fit_transform(x_arr)
x = pd.DataFrame(x_scaled)
# 开始预测
y = model.predict(x)
# 写结果文件
for i in range(10000):
    f = open('/mnt/sd01/sjjs_bj14/ans.csv','r+')
    f.read()
    f.write(label[i]+','+str(y[i])+'\n')
    f.close()
