
STAGE_TYPE=$1
BOT_TOKEN="7367256673:AAFMrd0loEadyExplJ8rr4RTCGu1B9swl6I"
CHAT_ID="268536608"

sleep 3

if [ "$CI_JOB_STATUS" == "success" ]; then
  MESSAGE="✅ Стадия $STAGE_TYPE $CI_JOB_NAME успешно завершена  $CI_PROJECT_URL/pipelines"
else
  MESSAGE="🚫 Стадия $STAGE_TYPE $CI_JOB_NAME завершилась с ошибкой!  $CI_PROJECT_URL/pipelines"
fi

curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"
