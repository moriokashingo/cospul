class GameController < ApplicationController
  def show
  end

  def tetris
  end

  def omikuji
    @cospul_pictures =CospulPicture.all
  end

  def kaonashi
  end

  def test
  end
end
