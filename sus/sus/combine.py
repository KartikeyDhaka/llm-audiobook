import os
from pydub import AudioSegment

intermediate_folder = 'converted/'

audio_files = [f for f in os.listdir(intermediate_folder) if f.endswith('.wav')]
audio_files.sort(key=lambda f: int(f.split('.')[0]))

final_audio = AudioSegment.empty()

for audio_file in audio_files:
    audio_path = os.path.join(intermediate_folder, audio_file)
    audio = AudioSegment.from_wav(audio_path)
    silence = AudioSegment.silent(duration=1000)
    final_audio += audio + silence

final_audio.export('audiobook.wav', format='wav')

file_path = 'audiobook.wav'
