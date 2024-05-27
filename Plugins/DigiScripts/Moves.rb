#===============================================================================
# Burns or freezes the target.
#===============================================================================
class Battle::Move::BurnOrFreezeTarget < Battle::Move
  def pbAdditionalEffect(user, target)
    return if target.damageState.substitute
    case @battle.pbRandom(3)
    when 0 then target.pbBurn(user) if target.pbCanBurn?(user, false, self)
    when 1 then target.pbFreeze if target.pbCanFreeze?(user, false, self)
    end
  end
end