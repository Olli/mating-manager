require "test_helper"

class AbilityTest < ActiveSupport::TestCase
  context :manager_apiary do
    setup do
      @user = FactoryGirl.create(:user_manager)
      @ma = FactoryGirl.create(:mating_apiary, user: @user)
      @ma2 = FactoryGirl.create(:mating_apiary)
      @ability = Ability.new(@user)
    end
    should "manage only managers own apiary" do
      assert @ability.can?( :manage, @ma)
      assert @ability.cannot?( :manage, @ma2 )
    end
  end
  context :manager_fatherlines do
    setup do
      @user = FactoryGirl.create(:user_manager)
      @ma = FactoryGirl.create(:mating_apiary, user: @user)
      @ma2 = FactoryGirl.create(:mating_apiary)
      @ability = Ability.new(@user)
    end
    should "create fatherline if have apiary" do
      assert @ability.can?( :create, FatherLine)
    end
    should "update fatherline which is inactive" do
      # inactive
      assert @ability.can?( :update, @ma.father_lines.inactive.first )
      # archived
      assert @ability.cannot?( :update, @ma2.father_lines.archived.first )
    end
  end

  context :deliverer do
    setup do
      @user = FactoryGirl.create(:user_deliverer)
      @ma = FactoryGirl.create(:mating_apiary)
      @ability = Ability.new(@user)
    end

    should "create matingapiary" do
      assert @ability.can?(:create, MatingApiary)
    end
    should "not can manage apiarys or fatherlines" do
      assert @ability.cannot?(:manage, @ma)
      assert @ability.cannot?(:manage, @ma.father_lines.first)
      assert @ability.cannot?(:create, FatherLine)
    end
    should "can see apiaries and all non inactive fatherlines" do
      assert @ability.can?(:read, @ma )
      assert @ability.cannot?(:read, FactoryGirl.create(:mating_apiary_offline))
      assert @ability.can?(:read, @ma.father_lines.active.first)
      assert @ability.can?(:read, @ma.father_lines.archived.first)
      assert @ability.cannot?(:read, @ma.father_lines.inactive.first)
    end
    should "can only read places and mating units" do
      assert @ability.can?(:read, @ma.places.first )
      assert @ability.cannot?(:write, @ma.places.first )
      assert @ability.can?(:read, @ma.places.first.mating_unit )
      assert @ability.cannot?(:write, @ma.places.first.mating_unit )

    end


  end
end