# frozen_string_literal: true

def Strike
  if roll1score == 10
    print 1
  else
    print 0
  end
end

def Spare
  if roll1score + role2score == 10
    print 1
  else
    print 0
  end
end
