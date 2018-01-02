# Preview all emails at http://localhost:3000/rails/mailers/speaker_mailer
class SpeakerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/speaker_mailer/signup_confirmation
  def signup_confirmation
    SpeakerMailer.signup_confirmation
  end

end
