import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn.neural_network import MLPClassifier as mlp

# 从CSV文件读取训练数据
df = pd.DataFrame(pd.read_csv('/mnt/sd01/sjjs_bj14/contest1/contest1_training.csv',header=None))
x = df.ix[:,1:] # 第2列往后是数据
y = df.ix[:,0]  # 第1列是标签
# 自动将数据分为训练集和测试集
x_train,x_test,y_train,y_test=train_test_split(x,y,random_state=0)
# 归一化
min_max_scaler = preprocessing.MinMaxScaler()
x_tr_arr = x_train.values
x_tr_scaled = min_max_scaler.fit_transform(x_tr_arr)
x_train = pd.DataFrame(x_tr_scaled)
x_te_arr = x_test.values
x_te_scaled = min_max_scaler.fit_transform(x_te_arr)
x_test = pd.DataFrame(x_te_scaled)
# 开始训练
model = mlp(activation='tanh',solver='adam',alpha=0.0001,learning_rate='adaptive',learning_rate_init=0.001,max_iter=200)
model.fit(x_train,y_train)
acc = model.score(x_test,y_test)
print(acc)
