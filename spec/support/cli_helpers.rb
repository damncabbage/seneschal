module CLIHelpers

  def preserving_env
    old_env = ENV.to_hash
    begin
      yield
    ensure
      ENV.clear
      ENV.update(old_env)
    end
  end

  def capture_stdout
    old_stdout = $stdout.dup
    rd, wr = make_pipe
    $stdout = wr
    yield
    wr.close
    rd.read
  ensure
    $stdout = old_stdout
  end

  def make_pipe
    IO.method(:pipe).arity.zero? ? IO.pipe : IO.pipe("BINARY")
  end

end
RSpec.configure do |c|
  c.include CLIHelpers, :integration => true
end
