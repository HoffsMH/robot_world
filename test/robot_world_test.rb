require_relative 'test_helper'
require 'app/models/robot_world'

class RobotWorldTest< MiniTest::Test
  def test_we_have_access_to_the_robot_world_class
    robot_world = RobotWorld.new("something")
    assert robot_world
  end

  def test_it_does_the_thing
    refute RobotWorld.db?(".")

    robot_world = RobotWorld("fake_hash")
    robot_world.populate("./")

    assert File.file?("robots.db")
    File.delete("robots.db")

    robots = [
      {
        name: "Matt",
        city: "Ocean Springs",
        state: "MS",
        birthdate: "07-04-1987",
        date_hired: "08-24-2015",
        department: "software"
      }
    ]
    robot_world = RobotWorld.new(robots)

    nick =
      {
        name: "Nick",
        city: "Lafayette",
        state: "LA",
        birthdate: "23-09-1987",
        date_hired: "08-24-2015",
        department: "software"
      }
    robot_world.add(nick)

    assert robot_world.find_by_name("Nick")
    assert_kind_of Robot, robot_world.find_by_name("Nick")
    assert_equal "MS", robot_world.find_by_name("Nick").state






    assert robot_world.find_by_name("Matt")

    assert robot_world.find_by_name("Matt")
    assert_kind_of Robot, robot_world.find_by_name("Matt")
    assert_equal "MS", robot_world.find_by_name("Matt").state


    robots = [
      {
        name: "Matt",
        city: "Ocean Springs",
        state: "CO",
        birthdate: "07-04-1987",
        date_hired: "08-24-2015",
        department: "software"
      }
    ]

    robot_world.update(robots[0])
    assert robot_world.find_by_name("Matt")
    assert_kind_of Robot, robot_world.find_by_name("Matt")
    assert_equal "CO", robot_world.find_by_name("Matt").state

    robot_world.delete(robots[0])


    refute robot_world.find_by_name("Matt")



    robots = [
      {
        name: "Matt",
        city: "Denver",
        state: "CO",
        birthdate: "07-04-1987",
        date_hired: "08-24-2015",
        department: "software"
      },

      {
        name: "Nick",
        city: "Lafayette",
        state: "LA",
        birthdate: "23-09-1987",
        date_hired: "08-24-2015",
        department: "finance"
      },

      {
        name: "Ben",
        city: "Lafayette",
        state: "LA",
        birthdate: "23-09-1967",
        date_hired: "08-24-2012",
        department: "software"
      }
    ]

    robot_world = RobotWorld.new(robots)
    assert_equal 30, robot_world.average_age


    refute robot_world.hired?("1999")

    assert robot_world.hired?("2015")

    assert_equal 2, robot_world.hired("2015")


    assert_equal 2, robot_world.department("software")


    assert_equal 2, robot_world.city("Lafayette")

    assert_equal 1, robot_world.city("Denver")


    assert_equal 2, robot_world.state("LA")


    assert_equal 1, robot_world.state("CO")
  end


  def test_it_knows_if_there_is_a_db
    File.delete("./robots.db")
    refute RobotWorld.db?(".")
    FileUtils.touch('./robots.db')
    assert RobotWorld.db?(".")
  end

  def test_it_can_create_a_db
    robot_world = RobotWorld.new("fake_hash")
    robot_world.populate("./")

    assert File.file?('./robots.db')
    File.delete('./robots.db')
  end

  def test_we_can_add_a_robot_to_our_world
    robots = [
      {
        name: "Matt",
        city: "Ocean Springs",
        state: "MS",
        birthdate: "07-04-1987",
        date_hired: "08-24-2015",
        department: "software"
      }
    ]
    robot_world = RobotWorld.new(robots)

    nick =
      {
        name: "Nick",
        city: "Lafayette",
        state: "LA",
        birthdate: "23-09-1987",
        date_hired: "08-24-2015",
        department: "software"
      }
    robot_world.add(nick)

    assert robot_world.find_by_name("Nick")
    assert_kind_of Robot, robot_world.find_by_name("Nick")
    assert_equal "LA", robot_world.find_by_name("Nick").state
  end

  def test_we_can_find_a_robot_by_name
    robots = [
      {
        name: "Matt",
        city: "Ocean Springs",
        state: "MS",
        birthdate: "07-04-1987",
        date_hired: "08-24-2015",
        department: "software"
      }
    ]
    robot_world = RobotWorld.new(robots)
    assert robot_world.find_by_name("matt")
  end
  def test_we_can_update_a_robot
    robots = [
      {
        name: "Matt",
        city: "Ocean Springs",
        state: "CO",
        birthdate: "07-04-1987",
        date_hired: "08-24-2015",
        department: "software"
      }
    ]

    robot_world.update(robots[0])
    assert robot_world.find_by_name("Matt")
    assert_kind_of Robot, robot_world.find_by_name("Matt")
    assert_equal "CO", robot_world.find_by_name("Matt").state
  end

  def test_we_can_delete_a_robot
    robot_world.delete(robots[0])


    refute robot_world.find_by_name("Matt")
  end

  def test_it_tells_you_the_average_age
    robot_world = RobotWorld.new(sample_robots)
    assert_equal 30, robot_world.average_age
  end

  def test_it_tells_you_whether_or_not_a_robot_was_hired_on_a_given_year
    robot_world = RobotWorld.new(sample_robots)
    refute robot_world.hired?("1999")
    assert robot_world.hired?("2015")
  end

  def test_it_tells_you_how_many_robots_where_hired_on_a_year
    robot_world = RobotWorld.new(sample_robots)
    assert_equal 2, robot_world.hired("2015")
  end

  def test_it_tells_you_how_many_robots_are_in_a_department
    robot_world = RobotWorld.new(sample_robots)
    assert_equal 2, robot_world.department("software")
  end

  def test_it_tells_you_how_many_robots_are_in_a_city
    robot_world = RobotWorld.new(sample_robots)
    assert_equal 2, robot_world.city("Lafayette")
    assert_equal 1, robot_world.city("Denver")
  end

  def test_it_tells_you_how_many_robots_are_in_a_state
    robot_world = RobotWorld.new(sample_robots)
    assert_equal 2, robot_world.state("LA")
    assert_equal 1, robot_world.state("CO")
  end
end

