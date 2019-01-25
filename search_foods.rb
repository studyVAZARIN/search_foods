# １~10のコンテナの内、3つのコンテナに食料がある
# 1dayに1回、1つのコンテナが調べられる、食料を発見するとlifeが1回復
# 食料を見つけたコンテナからは食料はなくなる（無限にとれない）
# 調べたコンテナから情報が得られる『隣のコンテナに食料は入っていない』or『隣のコンテナに食料が入っている』
# 1day終了時にlifeが１減少、初期lifeは3
# 5day終了までにライフが0になっていなければクリア（生存）
# 5day終了までにライフが0になるとゲームオーバー(死亡)

container = [0,1,1,1,0,0,0,0,0,0]
container.shuffle!

serched_container = [] #調べたコンテナ番号を入れる

day = 1
life = 3

while life > 0 && day < 5

  puts "DAY #{day}　あとDAY #{5 - day}"
  puts "LIFE #{life}"
  puts "[0][1][2][3][4][5][6][7][8][9]"
  puts "調査済みコンテナ: #{serched_container}"
  print "探索するコンテナを選択してください: "
  input = gets.to_i
  serched_container << input

  if container[input] == 0
      p "食料はなかった……"
    else container[input] == 1
      p "食料を見つけた！"
      life += 1
      container[input] = 0
    end

    #指定コンテナの左右のコンテナ情報を提示
    #指定コンテナが最右か最左のとき、取得する指定コンテナの左右のコンテナの指定を最右か最左にまるめる
    left = input - 1
    if left < 0
      left = 0
    end
    right = input + 1
    if right > 10
      right = 10
    end

    select_container = []
    select_container = container[left..right]
    sum = 0
    select_container.each { |n| sum += n }

    if sum > 0
      p "隣のコンテナに食料が入っているようだ"
    else
      p "隣のコンテナに食料は入っていないようだ"
    end

    life -= 1
    day += 1
end

if life > 0 && day == 5
  p "救助隊がやってきた！"
  p "You Suvived!"
  p container
else
  p "あなたは餓死した..."
  p "You Died..."
  p container
end
