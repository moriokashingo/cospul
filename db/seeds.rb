# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

User.create!(
  [
    {
      email: 'tanaka@gmail.com',
      password: 'tanaka',
      name: 'tanaka',
      image: open("#{Rails.root}/app/assets/images/seed/tanaka.jpg"),
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      email: 'suzuki@gmail.com',
      password: 'suzuki',
      name: 'suzuki',
      image: open("#{Rails.root}/app/assets/images/seed/suzuki.jpg"),
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    }
  ]
)


Cospul.create!(
  [
    {
      title: 'adidasのスーパースター',
      content: '全身黒で統一。洗練されたクールな印象を意識しました。',
      likes_count:'',
      user_id:'2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      title: 'tanakaのマウンテンパーカー「ザ・ノース・フェイス キッズマウンテンパーカー / ノベルティコンパクトジャケット」を使ったコーディネート',
      content: '＊おチビさんコーデ＊
      #やっぱりストリートが好き
      なんだかんだで最終日だーい
      カモフラマンパケミカル
      夏に履かそうと思ってしまって
      すっかり存在忘れてたオリーブくん
      なかなかのボーイッシュになってもた
      どこかで可愛さを…️考えた結果
      三つ編みおさげちゃん
      ねぇねにシャボン玉で遊んでもろて
      ご機嫌なさちこでありました
      ',
      likes_count:'',
      user_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
  ]
)

CospulDetail.create!(
  [
    {
      head: 'https://shop.adidas.jp/products/S98159/?&utm_source=google_pla&utm_medium=cpc&utm_content=pla_Catch_all_P&utm_campaign=search&gclid=CjwKCAiAzanuBRAZEiwA5yf4uunLX4xO49EAsv54t0TAp334o59fLrQWHtr0krXqgX6Xdn5H8nmYThoC4xkQAvD_BwE&gclsrc=aw.ds',
      top: 'https://voi.0101.co.jp/voi/wsg/wrt-5_mcd-WW768_cpg-371_pno-46_ino-01.html?gclid=CjwKCAiAzanuBRAZEiwA5yf4uld-TJv8fFqPQ_6biolrK21svBYGzqpmW4daXTPa7jMAE_EVOxgrrxoCVkcQAvD_BwE&ev_chn=shop&s_kwcid=AL!5689!3!84488669896!!!g!338709165319!&cid=aws_pc_10000800&ef_id=XY7GJQAAAFl5xX6l:20191112123118:s',
      inner: 'https://shop.adidas.jp/products/DV2857/?&utm_source=google_pla&utm_medium=cpc&utm_content=pla_Originals_B_Shortsleeve_kids&utm_campaign=search&gclid=CjwKCAiAzanuBRAZEiwA5yf4uj8v60MYl2B34rkgBr5ttgxQEtECwUkzow59AdPQdGiYIzMG5vH9ARoCrY8QAvD_BwE&gclsrc=aw.ds',
      bottom: 'https://voi.0101.co.jp/voi/wsg/wrt-5_mcd-WW768_cpg-371_pno-46_ino-01.html?gclid=CjwKCAiAzanuBRAZEiwA5yf4uld-TJv8fFqPQ_6biolrK21svBYGzqpmW4daXTPa7jMAE_EVOxgrrxoCVkcQAvD_BwE&ev_chn=shop&s_kwcid=AL!5689!3!84488669896!!!g!338709165319!&cid=aws_pc_10000800&ef_id=XY7GJQAAAFl5xX6l:20191112123118:s',
      shoe: 'https://item.rakuten.co.jp/abcmartsports/5305120001/?gclid=CjwKCAiAzanuBRAZEiwA5yf4uorlLTSIJn4e3ZcGE4M9jCkL4NcGw2O6aN_gcKfk1XkbOtVmV2IFNRoCS-UQAvD_BwE&scid=af_pc_etc&sc2id=af_113_0_10001868',
      cospul_id: '1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      top: 'https://wear.jp/item/16144811/',
      inner: 'https://wear.jp/snapitem/105371101/',
      bottom: 'https://wear.jp/item/20167489/',
      shoe: 'https://wear.jp/item/13883398/',
      cospul_id: '2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },

  ]
)


CospulPicture.create!(
  [
    {
      picture: open("#{Rails.root}/app/assets/images/seed/adidas子供.jpg"),
      cospul_id:'1',
      user_id:'2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      picture: open("#{Rails.root}/app/assets/images/seed/adidas子供2.jpg"),
      cospul_id:'1',
      user_id:'2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },    {
      picture: open("#{Rails.root}/app/assets/images/seed/adidas子供3.jpg"),
      cospul_id:'1',
      user_id:'2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      picture: open("#{Rails.root}/app/assets/images/seed/adidas子供4.jpg"),
      cospul_id:'1',
      user_id:'2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      picture: open("#{Rails.root}/app/assets/images/seed/チビカモフラ.jpg"),
      cospul_id:'2',
      user_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      picture: open("#{Rails.root}/app/assets/images/seed/チビカモフラ2.jpg"),
      cospul_id:'2',
      user_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },    {
      picture: open("#{Rails.root}/app/assets/images/seed/チビカモフラ3.jpg"),
      cospul_id:'2',
      user_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      picture: open("#{Rails.root}/app/assets/images/seed/チビカモフラ4.jpg"),
      cospul_id:'2',
      user_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
  ]
)