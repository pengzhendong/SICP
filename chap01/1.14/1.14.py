import os

# 返回一种硬币的币值，可以采用任意顺序


def first_denomination(kinds_of_coins):
    assert kinds_of_coins >= 1
    assert kinds_of_coins <= 5
    if kinds_of_coins == 1:
        return 1
    elif kinds_of_coins == 2:
        return 5
    elif kinds_of_coins == 3:
        return 10
    elif kinds_of_coins == 4:
        return 25
    else:
        return 50


def cc(amount, kinds_of_coins, parent):
    name = 'node_{}'.format(len(nodes))
    # 非根节点，父节点指向当前节点
    if parent != -1:
        trans.append('  {} -> {}'.format(parent, name))

    # 绘图相关逻辑
    node = '  {name} [label="{value}" shape=none]'
    if amount == 0:
        # 兑换现金为 0，添加一种方式
        nodes.append(node.format(name=name, value=1))
    else:
        # 继续兑换
        nodes.append(node.format(name=name, value='(cc {} {})').format(
            amount, kinds_of_coins))
        # 兑换现金小于 0 或硬币种类等于 0，该方式兑换失败
        if amount < 0 or kinds_of_coins == 0:
            child = 'node_{}'.format(len(nodes))
            nodes.append(node.format(name=child, value=0))
            trans.append('  {} -> {}'.format(name, child))

    # 兑换相关逻辑
    if amount == 0:
        return 1
    elif amount < 0 or kinds_of_coins == 0:
        return 0
    else:
        # 对于某种币值，可不兑换，可兑换
        return cc(amount, kinds_of_coins - 1, name) + cc(amount - first_denomination(kinds_of_coins), kinds_of_coins, name)


def count_change(amount):
    # 5 种硬币，根节点的父节点为 -1
    return cc(amount, 5, -1)


nodes = []
trans = []
count_change(11)

dot = open('1.14.dot', 'w')
dot.write('digraph G {\n')
for node in nodes:
    dot.write(node + '\n')
for tran in trans:
    dot.write(tran + '\n')
dot.write('}\n')

os.system('dot -Tpng 1.14.dot -o 1.14.png')
